import 'package:cd_client/model/extrenal/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_list.g.dart';

@JsonSerializable()
class ProductList {
  final List<Product> alcohols;
  final List<Product> beverages;
  final List<Product> candys;
  final List<Product> frozens;
  final List<Product> ices;
  final List<Product> instants;
  final List<Product> lifeuses;
  final List<Product> medics;
  final List<Product> mliks;
  final List<Product> noodles;
  final List<Product> onedates;
  final List<Product> snacks;
  final List<Product> tobaccos;

  ProductList(
      {required this.alcohols,
      required this.beverages,
      required this.candys,
      required this.frozens,
      required this.ices,
      required this.instants,
      required this.lifeuses,
      required this.medics,
      required this.mliks,
      required this.noodles,
      required this.onedates,
      required this.snacks,
      required this.tobaccos});

  ProductList.init()
      : alcohols = [],
        beverages = [],
        candys = [],
        frozens = [],
        ices = [],
        instants = [],
        lifeuses = [],
        medics = [],
        mliks = [],
        noodles = [],
        onedates = [],
        snacks = [],
        tobaccos = [];

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}
