import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  final String name;
  final IconData icon;
  final double? width;
  final bool? isPassword;
  final Function onChanged;

  const InputLogin(
      {super.key,
      required this.name,
      this.width,
      this.isPassword,
      required this.icon,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: (value) => onChanged(value),
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 24),
            prefixIcon: Icon(icon),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            hintText: name,
            filled: true,
            fillColor: CustomColor.whiteGrey),
        style: const TextStyle(fontSize: 16, color: CustomColor.inputGrey),
      ),
    );
  }
}
