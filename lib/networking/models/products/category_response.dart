import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryResponse {
  final int status;
  final String msg;
  final int count;
  final List<CategoryItem> data;

  CategoryResponse(this.status, this.msg, this.count, this.data);

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class CategoryItem {
  final String category_code;
  final String category_desc;
  final String createdAt;
  final String image;

  CategoryItem(this.category_code, this.category_desc, this.createdAt, this.image);

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return _$CategoryItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}
