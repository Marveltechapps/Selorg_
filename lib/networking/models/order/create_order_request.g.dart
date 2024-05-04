// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    CreateOrderRequest(
      OrderRequest.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'order': instance.order.toJson(),
    };

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      json['uniqueKey'] as String,
      json['orderNo'] as String,
      json['orderLocation'] as String,
      json['orderType'] as String,
      json['paymentType'] as String,
      json['status'] as String,
      json['holdStatus'] as String,
      json['addressVerified'] as String,
      json['paymentVerified'] as String,
      json['addressType'] as String,
      json['orderDate'] as String,
      json['shipbyDate'] as String,
      json['orderAmount'] as String,
      json['orderCurrency'] as String,
      json['conversionRate'] as String,
      json['isReplacement'] as String,
      json['customerCode'] as String,
      json['customerName'] as String,
      json['shipAddress1'] as String,
      json['shipAddress2'] as String,
      json['shipAddress3'] as String,
      json['shipAddress4'] as String,
      json['shipCity'] as String,
      json['shipState'] as String,
      json['shipCountry'] as String,
      json['shipPinCode'] as String,
      json['shipPhone1'] as String,
      json['shipPhone2'] as String,
      json['shipEmail1'] as String,
      json['shipEmail2'] as String,
      json['billName'] as String,
      json['billAddress1'] as String,
      json['billAddress2'] as String,
      json['billAddress3'] as String,
      json['billAddress4'] as String,
      json['billCity'] as String,
      json['billState'] as String,
      json['billCountry'] as String,
      json['billPinCode'] as String,
      json['billPhone1'] as String,
      json['billPhone2'] as String,
      json['billEmail1'] as String,
      json['billEmail2'] as String,
      json['landmark'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      json['orderRemarks'] as String,
      json['shippingCharges'] as String,
      json['custType'] as String,
      json['isB2B'] as String,
      json['orderProcessing'] as String,
      json['userConsent'] as String,
      (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['paymentItems'] as List<dynamic>)
          .map((e) => PaymentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'uniqueKey': instance.uniqueKey,
      'orderNo': instance.orderNo,
      'orderLocation': instance.orderLocation,
      'orderType': instance.orderType,
      'paymentType': instance.paymentType,
      'status': instance.status,
      'holdStatus': instance.holdStatus,
      'addressVerified': instance.addressVerified,
      'paymentVerified': instance.paymentVerified,
      'addressType': instance.addressType,
      'orderDate': instance.orderDate,
      'shipbyDate': instance.shipbyDate,
      'orderAmount': instance.orderAmount,
      'orderCurrency': instance.orderCurrency,
      'conversionRate': instance.conversionRate,
      'isReplacement': instance.isReplacement,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'shipAddress1': instance.shipAddress1,
      'shipAddress2': instance.shipAddress2,
      'shipAddress3': instance.shipAddress3,
      'shipAddress4': instance.shipAddress4,
      'shipCity': instance.shipCity,
      'shipState': instance.shipState,
      'shipCountry': instance.shipCountry,
      'shipPinCode': instance.shipPinCode,
      'shipPhone1': instance.shipPhone1,
      'shipPhone2': instance.shipPhone2,
      'shipEmail1': instance.shipEmail1,
      'shipEmail2': instance.shipEmail2,
      'billName': instance.billName,
      'billAddress1': instance.billAddress1,
      'billAddress2': instance.billAddress2,
      'billAddress3': instance.billAddress3,
      'billAddress4': instance.billAddress4,
      'billCity': instance.billCity,
      'billState': instance.billState,
      'billCountry': instance.billCountry,
      'billPinCode': instance.billPinCode,
      'billPhone1': instance.billPhone1,
      'billPhone2': instance.billPhone2,
      'billEmail1': instance.billEmail1,
      'billEmail2': instance.billEmail2,
      'landmark': instance.landmark,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'orderRemarks': instance.orderRemarks,
      'shippingCharges': instance.shippingCharges,
      'custType': instance.custType,
      'isB2B': instance.isB2B,
      'orderProcessing': instance.orderProcessing,
      'userConsent': instance.userConsent,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'paymentItems': instance.paymentItems.map((e) => e.toJson()).toList(),
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      json['lineno'] as String,
      json['channelSkuCode'] as String,
      json['orderQty'] as String,
      json['mrp'] as String,
      json['vendor'] as String,
      json['mode'] as String,
      json['locationCode'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'lineno': instance.lineno,
      'channelSkuCode': instance.channelSkuCode,
      'orderQty': instance.orderQty,
      'mrp': instance.mrp,
      'vendor': instance.vendor,
      'mode': instance.mode,
      'locationCode': instance.locationCode,
    };

PaymentItem _$PaymentItemFromJson(Map<String, dynamic> json) => PaymentItem(
      json['paymentMode'] as String,
      json['docNo'] as String,
      json['docDate'] as String,
      json['docBank'] as String,
      json['ifscCode'] as String,
      json['docAmt'] as String,
      json['amountReceived'] as String,
      json['branch'] as String,
      json['authCode'] as String,
      json['edcNo'] as String,
      json['udf1'] as String,
    );

Map<String, dynamic> _$PaymentItemToJson(PaymentItem instance) =>
    <String, dynamic>{
      'paymentMode': instance.paymentMode,
      'docNo': instance.docNo,
      'docDate': instance.docDate,
      'docBank': instance.docBank,
      'ifscCode': instance.ifscCode,
      'docAmt': instance.docAmt,
      'amountReceived': instance.amountReceived,
      'branch': instance.branch,
      'authCode': instance.authCode,
      'edcNo': instance.edcNo,
      'udf1': instance.udf1,
    };
