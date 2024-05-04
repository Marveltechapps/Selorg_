import 'package:json_annotation/json_annotation.dart';
part 'otp_verify_request.g.dart';

@JsonSerializable(explicitToJson: true)
class OtpVerifyRequest {
  final String phoneNumber;
  final String otp;
  OtpVerifyRequest(this.phoneNumber, this.otp);

  factory OtpVerifyRequest.fromJson(Map<String, dynamic> json) {
    return _$OtpVerifyRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpVerifyRequestToJson(this);
}