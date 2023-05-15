import 'package:flutter/material.dart';
import '../../util/constant/custom_color.dart';

class BtnRegisterChecker extends StatefulWidget {
  final String name;
  final String value;
  final Function() onPressed;

  const BtnRegisterChecker(
      {super.key,
      required this.name,
      required this.value,
      required this.onPressed});

  @override
  State<BtnRegisterChecker> createState() => _BtnRegisterCheckerState();
}

class _BtnRegisterCheckerState extends State<BtnRegisterChecker> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.value != "" ? widget.onPressed() : () {},
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            backgroundColor:
                widget.value != "" ? CustomColor.indigo : Colors.grey),
        child: Text(widget.name));
  }
}
