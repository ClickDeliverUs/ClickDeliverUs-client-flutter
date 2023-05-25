import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';
import '../../util/constant/custom_color.dart';

class BtnRegisterChecker extends StatelessWidget {
  final String name;
  final String value;
  final Function() onPressed;

  const BtnRegisterChecker(
      {super.key,
      required this.name,
      required this.value,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: value == "" ? null : onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
            ),
            backgroundColor: value == "" ? Colors.grey : CustomColor.indigo),
        child: Text(name));
  }
}
