// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponse _$OrdersResponseFromJson(Map<String, dynamic> json) =>
    OrdersResponse(
      (json['orderList'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersResponseToJson(OrdersResponse instance) =>
    <String, dynamic>{
      'orderList': instance.orderList,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      json['id'] as String,
      json['placedDate'] as String,
      json['title'] as String,
      json['status'] as String,
      json['totalPrice'] as String,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'placedDate': instance.placedDate,
      'title': instance.title,
      'status': instance.status,
      'totalPrice': instance.totalPrice,
    };
