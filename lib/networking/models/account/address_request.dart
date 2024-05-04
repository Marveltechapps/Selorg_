
import 'package:json_annotation/json_annotation.dart';
part 'address_request.g.dart';

@JsonSerializable()
class AddressRequest {
  String customer_id;
  String address_id;
  String label;
  String address1;
  String address2;
  String street;
  String city;
  String? landmark;
  String zip;
  String? latitude;
  String? longitude;
  bool isDefault;
  AddressRequest(this.customer_id, this.address_id, this.label, this.address1, this.address2, this.street, this.city, this.landmark, this.zip, this.latitude, this.longitude, this.isDefault);

  factory AddressRequest.fromJson(Map<String, dynamic> json) {
    return _$AddressRequestFromJson(json);
  }

  Map<String,  dynamic> toJson() => _$AddressRequestToJson(this);

}