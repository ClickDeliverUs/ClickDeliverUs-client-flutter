import 'package:flutter/material.dart';
import '../../../util/constant/standard.dart';

class BtnProductCategory extends StatelessWidget {
  final String title;

  const BtnProductCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Standard.defaultBorderRadius)),
              shadowColor: Colors.transparent),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ))),
    );
  }
}
