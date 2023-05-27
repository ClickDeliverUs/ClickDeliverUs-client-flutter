import 'package:flutter/cupertino.dart';

class RegisterInputProps {
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;
  final bool? isPassword;
  final int? maxLength;

  RegisterInputProps({
    required this.textEditingController,
    required this.labelText,
    required this.icon,
    this.isPassword,
    this.maxLength,
  });
}
