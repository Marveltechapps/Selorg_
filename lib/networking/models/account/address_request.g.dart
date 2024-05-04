// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRequest _$AddressRequestFromJson(Map<String, dynamic> json) =>
    AddressRequest(
      json['customer_id'] as String,
      json['address_id'] as String,
      json['label'] as String,
      json['address1'] as String,
      json['address2'] as String,
      json['street'] as String,
      json['city'] as String,
      json['landmark'] as String?,
      json['zip'] as String,
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['isDefault'] as bool,
    );

Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'customer_id': instance.customer_id,
      'address_id': instance.address_id,
      'label': instance.label,
      'address1': instance.address1,
      'address2': instance.address2,
      'street': instance.street,
      'city': instance.city,
      'landmark': instance.landmark,
      'zip': instance.zip,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isDefault': instance.isDefault,
    };
