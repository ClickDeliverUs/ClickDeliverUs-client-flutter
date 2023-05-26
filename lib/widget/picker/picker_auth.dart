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
        height: 60,
        decoration: BoxDecoration(
          color: CustomColor.whiteGrey,
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
            value == "" ? "생일" : value!,
            style: const TextStyle(fontSize: 16, color: CustomColor.inputGrey),
          )
        ]),
      ),
    );
  }
}
