import 'package:json_annotation/json_annotation.dart';
part 'otp_verify_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OtpVerifyResponse {
  final int status;
  final String message;
  final Profile customer;

  OtpVerifyResponse(this.status, this.message, this.customer);

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    return _$OtpVerifyResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpVerifyResponseToJson(this);
}

@JsonSerializable()
class Profile {
  final String customer_id;
  final String? name;
  final String? email;
  final String phoneNumber;
  final bool isVerified;
  final String lastLogin;
  Profile(this.customer_id, this.name, this.email, this.phoneNumber, this.isVerified, this.lastLogin);

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}