import 'package:flutter/material.dart';

import '../../util/constant/custom_color.dart';
import '../../util/constant/standard.dart';

class BtnGenderToggle extends StatelessWidget {
  final List<bool> gender;
  final void Function(int) onPressed;

  const BtnGenderToggle(
      {super.key, required this.gender, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: gender,
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
        selectedColor: CustomColor.indigo,
        color: Colors.grey,
        children: const [
          Text(
            "남",
            style: TextStyle(color: CustomColor.black),
          ),
          Text(
            "여",
            style: TextStyle(color: CustomColor.black),
          ),
        ]);
  }
}
