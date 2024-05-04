import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginRequest {
  final String phoneNumber;
  LoginRequest(this.phoneNumber);

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}