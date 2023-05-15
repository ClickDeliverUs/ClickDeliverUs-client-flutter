import 'package:cd_client/util/constant/const_text.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final String name;
  final double? width;
  final Function(String) onChanged;

  const InputLogin(
      {super.key, required this.name, required this.onChanged, this.width});

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  IconData _getPrefixIcon() {
    switch (widget.name) {
      case ConstText.id:
        return Icons.account_circle;
      case ConstText.password:
        return Icons.lock;
      case ConstText.verifyPassword:
        return Icons.check;
      case ConstText.nickName:
        return Icons.face;
      default:
        return Icons.question_mark;
    }
  }

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
              prefixIcon: Icon(_getPrefixIcon()),
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
