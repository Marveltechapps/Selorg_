import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/preference.dart';
import 'package:sel_org/repository/account/app_repository.dart';

import '../../../../networking/models/account/address_response.dart';
import '../../../../repository/db/address_db_repository.dart';
import '../../../../repository/db/db_repository.dart';
import '../state/cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final Preference appPreference;
  final AppRepository appRepository;
  final DbRepository dbRepository;
  final AddressDbRepository addressDbRepository;

  CartCubit(this.appPreference, this.appRepository, this.dbRepository,
      this.addressDbRepository)
      : super(CartInitial());

  void loadCart() async {
    emit(CartLoading());
    Box box = await dbRepository.openBox();
    var cartList = dbRepository.getCartList(box);
    emit(CartLoaded(cartList));
    print("Cart count: ${cartList.length}");
  }

  void clearCart() async {
    Box box = await dbRepository.openBox();
    var cartList = dbRepository.getCartList(box);
    for (var element in cartList) {
      element.delete();
    }
  }

  void getDefaultAddress() async {
    Box box = await addressDbRepository.openBox();
    Address? address = await addressDbRepository.getDefaultAddress(box);
    emit(AddressLoaded(address));
  }
}
