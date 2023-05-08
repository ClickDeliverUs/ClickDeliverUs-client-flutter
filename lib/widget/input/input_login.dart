import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final String name;

  const InputLogin({super.key, required this.name});

  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  Icon _getPrefixIcon(String name) {
    switch (name) {
      case "email":
        return const Icon(Icons.email);
      case "password":
        return const Icon(Icons.lock);
      default:
        return const Icon(Icons.question_mark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: _getPrefixIcon(widget.name),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)),
          labelText: widget.name,
          filled: true,
          fillColor: const Color.fromARGB(73, 255, 255, 255)),
    );
  }
}
