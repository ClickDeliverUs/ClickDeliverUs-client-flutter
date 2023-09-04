import 'package:flutter/material.dart';

class TertiaryBtn extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color? foregroundColor;

  const TertiaryBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor ?? Colors.black,
        ),
      ),
    );
  }
}
