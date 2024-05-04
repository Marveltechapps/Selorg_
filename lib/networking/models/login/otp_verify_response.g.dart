// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerifyResponse _$OtpVerifyResponseFromJson(Map<String, dynamic> json) =>
    OtpVerifyResponse(
      json['status'] as int,
      json['message'] as String,
      Profile.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpVerifyResponseToJson(OtpVerifyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer.toJson(),
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['customer_id'] as String,
      json['name'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String,
      json['isVerified'] as bool,
      json['lastLogin'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'customer_id': instance.customer_id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isVerified': instance.isVerified,
      'lastLogin': instance.lastLogin,
    };
