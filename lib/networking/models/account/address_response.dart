import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse  {
  int? code;
  String message;
  int? count;
  List<Address> address;
  AddressResponse(this.code, this.message, this.count, this.address);

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return _$AddressResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class AddressListResponse {
  int? status;
  String message;
  int? count;
  List<Address> addresses;
  AddressListResponse(this.status, this.message, this.count, this.addresses);

  factory AddressListResponse.fromJson(Map<String, dynamic> json) {
    return _$AddressListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressListResponseToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Address extends HiveObject {
  @HiveField(0)
  String customer_id;
  @HiveField(1)
  String address_id;
  @HiveField(2)
  String label;
  @HiveField(3)
  String address1;
  @HiveField(4)
  String address2;
  @HiveField(5)
  String street;
  @HiveField(6)
  String city;
  @HiveField(7)
  String zip;
  @HiveField(8)
  String? landmark;
  @HiveField(9)
  String? latitude;
  @HiveField(10)
  String? longitude;
  @HiveField(11)
  bool isDefault;

  Address(this.customer_id, this.address_id, this.label, this.address1, this.address2, this.street, this.city, this.zip, this.landmark, this.latitude, this.longitude, this.isDefault);

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}