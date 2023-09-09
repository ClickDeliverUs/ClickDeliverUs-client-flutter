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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        sId: json["sId"],
        menuId: json["menuId"],
        product: json["product"],
        count: json["json"]);
  }
}
