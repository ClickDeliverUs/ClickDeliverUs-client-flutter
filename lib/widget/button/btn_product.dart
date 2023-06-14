import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class BtnProduct extends StatelessWidget {
  const BtnProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("haha");
      },
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: CustomColor.whiteGrey,
            borderRadius: BorderRadius.circular(Standard.defaultBorderRadius)),
        child: const Center(
          child: Text("상품"),
        ),
      ),
    );
  }
}
