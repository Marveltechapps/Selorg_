// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      json['status'] as int,
      json['msg'] as String,
      json['count'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) => CategoryItem(
      json['category_code'] as String,
      json['category_desc'] as String,
      json['createdAt'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'category_code': instance.category_code,
      'category_desc': instance.category_desc,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };
