import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class BtnSubmit extends StatelessWidget {
  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const BtnSubmit(
      {super.key,
      required this.name,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
        ),
        shadowColor: Colors.transparent,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 15, fontFamily: "KBO"),
      ),
    );
  }
}
