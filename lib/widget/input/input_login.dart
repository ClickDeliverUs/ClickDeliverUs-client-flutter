import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final String name;
  final Function(String) onChanged;
  final double? width;

  const InputLogin(
      {super.key, required this.name, required this.onChanged, this.width});

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  IconData _getPrefixIcon(String name) {
    switch (name) {
      case "아이디":
        return Icons.account_circle;
      case "비밀번호":
        return Icons.lock;
      case "비밀번호 확인":
        return Icons.check;
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
        obscureText:
            widget.name == "비밀번호" || widget.name == "비밀번호 확인" ? true : false,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            prefixIcon: Icon(_getPrefixIcon(widget.name)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.transparent)),
            labelText: widget.name,
            filled: true,
            fillColor: const Color.fromARGB(255, 245, 245, 245)),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
