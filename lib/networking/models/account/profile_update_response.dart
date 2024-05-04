
import 'package:json_annotation/json_annotation.dart';

import '../login/otp_verify_response.dart';

part 'profile_update_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileUpdateResponse {
  final int status;
  final String message;
  final Profile customer;

  ProfileUpdateResponse(this.status, this.message, this.customer);

  factory ProfileUpdateResponse.fromJson(Map<String, dynamic> json) {
    return _$ProfileUpdateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileUpdateResponseToJson(this);
}