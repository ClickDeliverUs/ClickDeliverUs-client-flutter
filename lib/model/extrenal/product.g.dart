// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      sId: json['sId'] as int,
      menuId: json['menuId'] as int,
      goodsName: json['goodsName'] as String,
      goodsCount: json['goodsCount'] as int,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'sId': instance.sId,
      'menuId': instance.menuId,
      'goodsName': instance.goodsName,
      'goodsCount': instance.goodsCount,
      'category': instance.category,
    };
