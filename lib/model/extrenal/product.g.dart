// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      sId: json['sId'] as int,
      menuId: json['menuId'] as int,
      product: json['product'] as String,
      count: json['count'] as int,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'sId': instance.sId,
      'menuId': instance.menuId,
      'product': instance.product,
      'count': instance.count,
      'category': instance.category,
    };
