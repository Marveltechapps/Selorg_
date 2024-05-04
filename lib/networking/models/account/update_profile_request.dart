import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  final String customer_id;
  final String name;
  final String email;
  UpdateProfileRequest(this.customer_id, this.name, this.email);

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}