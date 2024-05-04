import 'package:json_annotation/json_annotation.dart';
part 'sub_category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SubCategoryResponse {
  final int status;
  final String msg;
  final int count;
  final List<SubCategoryItem> data;
  SubCategoryResponse(this.status, this.msg, this.count, this.data);

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    return _$SubCategoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubCategoryResponseToJson(this);
}

@JsonSerializable()
class SubCategoryItem {
  final String category_code;
  final String category_desc;
  final String parent_code;
  final String createdAt;
  final String image;

  SubCategoryItem(this.category_code, this.category_desc, this.parent_code, this.createdAt, this.image);

  factory SubCategoryItem.fromJson(Map<String, dynamic> json) {
    return _$SubCategoryItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubCategoryItemToJson(this);
}