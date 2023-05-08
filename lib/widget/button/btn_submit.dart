import 'package:flutter/material.dart';

class BtnSubmit extends StatefulWidget {
  final double width;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onPress;

  const BtnSubmit(
      {super.key,
      required this.width,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onPress});

  @override
  State<BtnSubmit> createState() => _BtnSubmitState();
}

class _BtnSubmitState extends State<BtnSubmit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          widget.onPress();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          shadowColor: Colors.transparent,
          foregroundColor: widget.foregroundColor,
          backgroundColor: widget.backgroundColor,
        ),
        child: const Text("Login"),
      ),
    );
  }
}
