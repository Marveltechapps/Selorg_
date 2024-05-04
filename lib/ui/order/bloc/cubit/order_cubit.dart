import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:sel_org/core/preference/app_preference.dart';
import 'package:sel_org/networking/models/account/address_response.dart';
import 'package:sel_org/networking/models/api_response.dart';
import 'package:sel_org/networking/models/order/create_order_request.dart';
import 'package:sel_org/networking/models/order/create_order_response.dart';
import 'package:sel_org/ui/dashboard/models/cart_item.dart';

import '../../../../core/preference/preference.dart';
import '../../../../repository/account/app_repository.dart';
import '../../../../repository/db/address_db_repository.dart';
import '../../../../repository/db/db_repository.dart';
import '../state/order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  final Preference appPreference;
  final AppRepository appRepository;
  final DbRepository dbRepository;
  final AddressDbRepository addressDbRepository;

  OrderCubit(this.appPreference, this.appRepository, this.dbRepository, this.addressDbRepository) : super(OrderInitial());

  void createOrder() async {
    emit(CreateOrderLoading());
    var customerName = await appPreference.getPrefString(key_name);
    var customerMobile = await appPreference.getPrefString(key_phone_number);
    var customerId = await appPreference.getPrefString(key_customer_id);
    var customerEmail = await appPreference.getPrefString(key_email);
    final box = await dbRepository.openBox();
    Box addressBox = await addressDbRepository.openBox();
    Address address = addressBox.values.first;
    List<CartItem> cartItems = dbRepository.getCartList(box);
    List<OrderItem> orderItems = List.empty(growable: true);
    for (var index = 0; index < cartItems.length; index++) {
      orderItems.add(
          OrderItem(index.toString(), cartItems[index].skuCode, cartItems[index].orderQty.toString(), cartItems[index].mrpPrice, cartItems[index].vendorName.split("-")[0], "wms", "M07"));
    }
    final finalPrice = calculatePrice(cartItems);
    final uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
    List<PaymentItem> paymentItems = List.empty(growable: true);
    paymentItems.add(PaymentItem("Credit Card", "", "", "Axis", "", finalPrice.toString(), "", "", "", "", ""));
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    String orderDate = dateFormat.format(DateTime.now());
    OrderRequest orderRequest = OrderRequest(
        "",
        "",
        "M07",
        "Prepaid",
        "Credit Card",
        "Confirmed",
        "no",
        "yes",
        "yes",
        address.label,
        orderDate,
        "",
        finalPrice.toString(),
        "INR",
        "1.00",
        "no",
        customerId,
        customerName,
        address.address1,
        address.address2,
        address.street,
        address.city,
        address.city,
        "TamilNadu",
        "India",
        address.zip,
        customerMobile,
        "",
        customerEmail.isEmpty ? "No email" : customerEmail,
        "",
        customerName,
        address.address1,
        address.address2,
        address.street,
        address.city,
        address.city,
        "TamilNadu",
        "India",
        address.zip,
        customerMobile,
        "",
        customerEmail.isEmpty ? "No email" : customerEmail,
        "",
        address.landmark ?? "",
        double.parse(address.latitude ?? "").toStringAsPrecision(6),
        double.parse(address.longitude ?? "").toStringAsPrecision(6),
        "",
        "",
        "B2C",
        "0",
        "B2C",
        "N",
        orderItems,
        paymentItems);
    CreateOrderRequest createOrderRequest = CreateOrderRequest(orderRequest);
    ApiResult apiResult = await appRepository.createOrder(createOrderRequest);
    switch (apiResult) {
      case Success():
        CreateOrderResponse response = apiResult.value;
        if (response.OrderStatus.requestStatus.status == "Success") {
          emit(CreateOrderSuccess());
        } else {
          emit(CreateOrderFailed());
        }
        break;

      case Error():
      default:
        print("Error ");
        emit(CreateOrderFailed());
        break;
    }
  }

  void calculateTotalPrice() async {
    final box = await dbRepository.openBox();
    List<CartItem> cartItems = dbRepository.getCartList(box);
    var totalPrice = 0.0;
    var totalMrpPrice = 0.0;
    for (var element in cartItems) {
      totalPrice = totalPrice + double.parse(element.price);
      totalMrpPrice = totalMrpPrice + double.parse(element.mrpPrice);
    }
    emit(TotalPrice(totalPrice));
  }

  double calculatePrice(List<CartItem> cartItems) {
    var totalPrice = 0.0;
    var totalMrpPrice = 0.0;
    for (var element in cartItems) {
      totalPrice = totalPrice + double.parse(element.price);
      totalMrpPrice = totalMrpPrice + double.parse(element.mrpPrice);
    }
    return totalPrice;
  }
}
