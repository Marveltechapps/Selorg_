// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressResponse _$AddAddressResponseFromJson(Map<String, dynamic> json) =>
    AddAddressResponse(
      json['message'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddAddressResponseToJson(AddAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'address': instance.address,
    };
