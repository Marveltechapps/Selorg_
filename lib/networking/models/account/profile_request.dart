import 'package:json_annotation/json_annotation.dart';

part 'profile_request.g.dart';

@JsonSerializable()
class ProfileRequest {
  final String customer_id;
  ProfileRequest(this.customer_id);

  factory ProfileRequest.fromJson(Map<String, dynamic> json) {
    return _$ProfileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileRequestToJson(this);
}