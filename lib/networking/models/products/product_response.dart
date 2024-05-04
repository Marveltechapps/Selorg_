import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  final int status;
  final String msg;
  final int count;
  final List<ProductItem> data;
  ProductResponse(this.status, this.msg, this.count, this.data);

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductItem {
  @JsonKey(name: "_id")
  final String id;
  final String skuCode;
  final String skuName;
  final String size;
  final String mrp;
  final String salePrice;
  final String baseCost;
  final String imageURL;
  final String vendorName;
  final String isActive;
  final String isStocked;
  ProductItem(
      this.id,
      this.skuCode,
      this.skuName,
      this.size,
      this.mrp,
      this.salePrice,
      this.baseCost,
      this.imageURL,
      this.vendorName,
      this.isActive,
      this.isStocked);

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return _$ProductItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
