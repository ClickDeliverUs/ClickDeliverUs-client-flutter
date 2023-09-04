import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class PickerAuth extends StatelessWidget {
  final IconData icon;
  final dynamic onTap;
  final String? value;
  const PickerAuth(
      {super.key, required this.icon, required this.onTap, this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColor.whiteGrey, width: 2),
          borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              icon,
              color: Colors.grey,
            ),
          ),
          Text(
            value == "" ? "생년월일" : value!,
            style: const TextStyle(
                fontSize: 12, color: CustomColor.inputGrey, fontFamily: "KBO"),
          )
        ]),
      ),
    );
  }
}
