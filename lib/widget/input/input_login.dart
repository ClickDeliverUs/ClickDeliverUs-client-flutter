import 'package:cd_client/util/constant/const_text.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final String name;
  final double? width;
  final IconData icon;
  final Function(String) onChanged;

  const InputLogin(
      {super.key,
      required this.name,
      this.width,
      required this.icon,
      required this.onChanged});

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: 60,
        child: TextField(
          onChanged: (value) => widget.onChanged(value),
          obscureText: widget.name == ConstText.password ||
                  widget.name == ConstText.verifyPassword
              ? true
              : false,
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(widget.icon),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Colors.transparent)),
              labelText: widget.name,
              filled: true,
              fillColor: const Color.fromARGB(255, 245, 245, 245)),
          style: const TextStyle(fontSize: 14),
        ));
  }
}
