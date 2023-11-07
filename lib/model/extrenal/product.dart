import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int sId;
  final int menuId;
  final String goodsName;
  final int goodsCount;
  final String category;

  Product(
      {required this.sId,
      required this.menuId,
      required this.goodsName,
      required this.goodsCount,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
