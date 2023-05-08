import 'package:flutter/material.dart';

class BtnOAuth2Login extends StatefulWidget {
  final double width;
  final String name;
  final Color backgroundColor;

  const BtnOAuth2Login(
      {super.key,
      required this.width,
      required this.name,
      required this.backgroundColor});

  @override
  State<BtnOAuth2Login> createState() => _BtnOAuth2LoginState();
}

class _BtnOAuth2LoginState extends State<BtnOAuth2Login> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 50,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            shadowColor: Colors.transparent,
            foregroundColor: Colors.white,
            backgroundColor: widget.backgroundColor,
          ),
          child: Text(widget.name)),
    );
  }
}
