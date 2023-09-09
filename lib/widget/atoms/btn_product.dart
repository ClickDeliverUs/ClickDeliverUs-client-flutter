import 'package:cd_client/model/extrenal/product.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: CustomColor.whiteGrey,
            borderRadius: BorderRadius.circular(Standard.defaultBorderRadius)),
        child: Center(
          child: Text(product.product),
        ),
      ),
    );
  }
}
