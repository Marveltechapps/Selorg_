
import 'package:json_annotation/json_annotation.dart';
part 'sub_category_request.g.dart';

@JsonSerializable(explicitToJson: true)
class SubCategoryRequest {
  String categorycode;
  SubCategoryRequest(this.categorycode);

  factory SubCategoryRequest.fromJson(Map<String, dynamic> json) {
    return _$SubCategoryRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubCategoryRequestToJson(this);
}