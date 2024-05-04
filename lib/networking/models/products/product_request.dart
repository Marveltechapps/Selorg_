import 'package:json_annotation/json_annotation.dart';
part 'product_request.g.dart';

@JsonSerializable()
class ProductRequest {
  final String subcategorycode;
  ProductRequest(this.subcategorycode);

  factory ProductRequest.fromJson(Map<String, dynamic> json) {
    return _$ProductRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);
}