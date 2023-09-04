import 'package:flutter/cupertino.dart';

class InputData {
  final TextEditingController textEditingController;
  final int? maxLength;
  bool? obscureText = false;

  InputData(
      {required this.textEditingController, this.maxLength, this.obscureText});
}
