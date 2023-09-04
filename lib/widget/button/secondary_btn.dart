import 'package:cd_client/util/helper/enum.dart';
import 'package:flutter/material.dart';

class SecondaryBtn extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final WidgetColor widgetColor;
  final WidgetSize widgetSize;
  final double? width;

  const SecondaryBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.widgetColor,
      required this.widgetSize,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: widgetSize == WidgetSize.big ? 57 : 45,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
