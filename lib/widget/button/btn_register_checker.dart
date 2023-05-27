import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';
import '../../util/constant/custom_color.dart';

class BtnRegisterChecker extends StatefulWidget {
  final String name;
  final String value;
  final Function(BuildContext) onPressed;

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
        onPressed:
            widget.value.isEmpty ? null : () => widget.onPressed(context),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
            ),
            backgroundColor:
                widget.value.isEmpty ? Colors.grey : CustomColor.indigo),
        child: Text(widget.name));
  }
}
