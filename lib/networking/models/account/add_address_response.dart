import 'package:json_annotation/json_annotation.dart';
import 'package:sel_org/networking/models/account/address_response.dart';

part 'add_address_response.g.dart';

@JsonSerializable()
class AddAddressResponse {
  String message;
  Address address;
  AddAddressResponse(this.message, this.address);

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) {
    return _$AddAddressResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddAddressResponseToJson(this);
}