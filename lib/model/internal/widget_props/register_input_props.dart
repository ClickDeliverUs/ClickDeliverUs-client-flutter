import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class RegisterInputProps {
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;
  final bool? isPassword;
  final int? maxLength;
  final bool? borderCondition;
  final List<TextInputFormatter>? textInputFormatter;

  RegisterInputProps(
      {required this.textEditingController,
      required this.labelText,
      required this.icon,
      this.isPassword,
      this.maxLength,
      this.borderCondition,
      this.textInputFormatter});
}
