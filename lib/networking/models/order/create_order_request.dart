import 'package:json_annotation/json_annotation.dart';

part 'create_order_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrderRequest {
  OrderRequest order;

  CreateOrderRequest(this.order);

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderRequest {
  String uniqueKey;
  String orderNo;
  String orderLocation;
  String orderType;
  String paymentType;
  String status;
  String holdStatus;
  String addressVerified;
  String paymentVerified;
  String addressType;
  String orderDate;
  String shipbyDate;
  String orderAmount;
  String orderCurrency;
  String conversionRate;
  String isReplacement;
  String customerCode;
  String customerName;
  String shipAddress1;
  String shipAddress2;
  String shipAddress3;
  String shipAddress4;
  String shipCity;
  String shipState;
  String shipCountry;
  String shipPinCode;
  String shipPhone1;
  String shipPhone2;
  String shipEmail1;
  String shipEmail2;
  String billName;
  String billAddress1;
  String billAddress2;
  String billAddress3;
  String billAddress4;
  String billCity;
  String billState;
  String billCountry;
  String billPinCode;
  String billPhone1;
  String billPhone2;
  String billEmail1;
  String billEmail2;
  String landmark;
  String latitude;
  String longitude;
  String orderRemarks;
  String shippingCharges;
  String custType;
  String isB2B;
  String orderProcessing;
  String userConsent;
  List<OrderItem> items;
  List<PaymentItem> paymentItems;

  OrderRequest(
    this.uniqueKey,
    this.orderNo,
    this.orderLocation,
    this.orderType,
    this.paymentType,
    this.status,
    this.holdStatus,
    this.addressVerified,
    this.paymentVerified,
    this.addressType,
    this.orderDate,
    this.shipbyDate,
    this.orderAmount,
    this.orderCurrency,
    this.conversionRate,
    this.isReplacement,
    this.customerCode,
    this.customerName,
    this.shipAddress1,
    this.shipAddress2,
    this.shipAddress3,
    this.shipAddress4,
    this.shipCity,
    this.shipState,
    this.shipCountry,
    this.shipPinCode,
    this.shipPhone1,
    this.shipPhone2,
    this.shipEmail1,
    this.shipEmail2,
    this.billName,
    this.billAddress1,
    this.billAddress2,
    this.billAddress3,
    this.billAddress4,
    this.billCity,
    this.billState,
    this.billCountry,
    this.billPinCode,
    this.billPhone1,
    this.billPhone2,
    this.billEmail1,
    this.billEmail2,
    this.landmark,
    this.latitude,
    this.longitude,
    this.orderRemarks,
    this.shippingCharges,
    this.custType,
    this.isB2B,
    this.orderProcessing,
    this.userConsent,
    this.items,
      this.paymentItems
  );

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return _$OrderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderItem {
  String lineno;
  String channelSkuCode;
  String orderQty;
  String mrp;
  String vendor;
  String mode;
  String locationCode;

  OrderItem(this.lineno, this.channelSkuCode, this.orderQty, this.mrp, this.vendor, this.mode,
      this.locationCode);

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return _$OrderItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentItem {
  String paymentMode;
  String docNo;
  String docDate;
  String docBank;
  String ifscCode;
  String docAmt;
  String amountReceived;
  String branch;
  String authCode;
  String edcNo;
  String udf1;

  PaymentItem(this.paymentMode, this.docNo, this.docDate, this.docBank, this.ifscCode, this.docAmt, this.amountReceived, this.branch,
      this.authCode, this.edcNo, this.udf1);

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return _$PaymentItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentItemToJson(this);
}
