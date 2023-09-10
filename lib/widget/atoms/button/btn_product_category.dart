import 'package:flutter/material.dart';
import '../../../util/constant/standard.dart';

class BtnProductCategory extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const BtnProductCategory(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
          onPressed: onPressed,
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
