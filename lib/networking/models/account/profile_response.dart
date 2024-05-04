import 'package:json_annotation/json_annotation.dart';

import '../login/otp_verify_response.dart';

part 'profile_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileResponse {
  final int status;
  final String message;
  final Profile profile;
  ProfileResponse(this.status, this.message, this.profile);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}