import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  final int status;
  final String message;

  LoginResponse(this.status, this.message);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}