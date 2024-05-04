// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['status'] as int,
      json['msg'] as String,
      json['count'] as int,
      (json['data'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'count': instance.count,
      'data': instance.data,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      json['_id'] as String,
      json['skuCode'] as String,
      json['skuName'] as String,
      json['size'] as String,
      json['mrp'] as String,
      json['salePrice'] as String,
      json['baseCost'] as String,
      json['imageURL'] as String,
      json['vendorName'] as String,
      json['isActive'] as String,
      json['isStocked'] as String,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'skuCode': instance.skuCode,
      'skuName': instance.skuName,
      'size': instance.size,
      'mrp': instance.mrp,
      'salePrice': instance.salePrice,
      'baseCost': instance.baseCost,
      'imageURL': instance.imageURL,
      'vendorName': instance.vendorName,
      'isActive': instance.isActive,
      'isStocked': instance.isStocked,
    };
