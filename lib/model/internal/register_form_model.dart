import 'package:flutter/cupertino.dart';

class RegisterFormModel {
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;
  final bool? isPassword;
  final int? maxLength;
  final String? Function(String?)? validator;

  RegisterFormModel({
    required this.textEditingController,
    required this.labelText,
    required this.icon,
    this.isPassword,
    this.maxLength,
    this.validator,
  });
}
