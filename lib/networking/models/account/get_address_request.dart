import 'package:json_annotation/json_annotation.dart';

part 'get_address_request.g.dart';

@JsonSerializable()
class GetAddressRequest {
  final String customer_id;
  GetAddressRequest(this.customer_id);

  factory GetAddressRequest.fromJson(Map<String, dynamic> json) {
    return _$GetAddressRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAddressRequestToJson(this);
}