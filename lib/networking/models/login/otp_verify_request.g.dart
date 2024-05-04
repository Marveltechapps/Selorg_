// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpVerifyRequest _$OtpVerifyRequestFromJson(Map<String, dynamic> json) =>
    OtpVerifyRequest(
      json['phoneNumber'] as String,
      json['otp'] as String,
    );

Map<String, dynamic> _$OtpVerifyRequestToJson(OtpVerifyRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };
