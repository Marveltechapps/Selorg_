// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateResponse _$ProfileUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateResponse(
      json['status'] as int,
      json['message'] as String,
      Profile.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileUpdateResponseToJson(
        ProfileUpdateResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer.toJson(),
    };
