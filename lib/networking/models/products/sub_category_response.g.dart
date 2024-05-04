// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    SubCategoryResponse(
      json['status'] as int,
      json['msg'] as String,
      json['count'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => SubCategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
        SubCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

SubCategoryItem _$SubCategoryItemFromJson(Map<String, dynamic> json) =>
    SubCategoryItem(
      json['category_code'] as String,
      json['category_desc'] as String,
      json['parent_code'] as String,
      json['createdAt'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$SubCategoryItemToJson(SubCategoryItem instance) =>
    <String, dynamic>{
      'category_code': instance.category_code,
      'category_desc': instance.category_desc,
      'parent_code': instance.parent_code,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };
