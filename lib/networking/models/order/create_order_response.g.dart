// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    CreateOrderResponse(
      CreateOrderStatusResponse.fromJson(
          json['OrderStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
        CreateOrderResponse instance) =>
    <String, dynamic>{
      'OrderStatus': instance.OrderStatus.toJson(),
    };

CreateOrderStatusResponse _$CreateOrderStatusResponseFromJson(
        Map<String, dynamic> json) =>
    CreateOrderStatusResponse(
      json['responseCode'] as int,
      json['responseMessage'] as String,
      RequestStatus.fromJson(json['requestStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderStatusResponseToJson(
        CreateOrderStatusResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'requestStatus': instance.requestStatus.toJson(),
    };

RequestStatus _$RequestStatusFromJson(Map<String, dynamic> json) =>
    RequestStatus(
      json['uniqueKey'] as String,
      json['status'] as String,
      json['errorCode'] as String?,
      json['errorDesc'] as String?,
    );

Map<String, dynamic> _$RequestStatusToJson(RequestStatus instance) =>
    <String, dynamic>{
      'uniqueKey': instance.uniqueKey,
      'status': instance.status,
      'errorCode': instance.errorCode,
      'errorDesc': instance.errorDesc,
    };
