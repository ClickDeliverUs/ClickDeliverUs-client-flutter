import 'package:cd_client/util/constant/const_text.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  final String name;
  final double? width;
  final IconData icon;
  final Function onChanged;

  const InputLogin(
      {super.key,
      required this.name,
      this.width,
      required this.icon,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        onChanged: (value) => onChanged(name, value),
        obscureText:
            name == ConstText.password || name == ConstText.verifyPassword
                ? true
                : false,
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
            fillColor: const Color.fromARGB(255, 245, 245, 245)),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
