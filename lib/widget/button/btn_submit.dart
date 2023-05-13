import 'package:flutter/material.dart';

class BtnSubmit extends StatefulWidget {
  final double width;
  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onPress;

  const BtnSubmit(
      {super.key,
      required this.width,
      required this.name,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.onPress});

  @override
  State<BtnSubmit> createState() => _BtnSubmitState();
}

class _BtnSubmitState extends State<BtnSubmit> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPress();
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(widget.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        shadowColor: Colors.transparent,
        foregroundColor: widget.foregroundColor,
        backgroundColor: widget.backgroundColor,
      ),
      child: Text(widget.name),
    );
  }
}
