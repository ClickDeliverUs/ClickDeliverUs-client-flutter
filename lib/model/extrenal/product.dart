import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int sId;
  final int menuId;
  final String product;
  final int count;

  Product(
      {required this.sId,
      required this.menuId,
      required this.product,
      required this.count});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
