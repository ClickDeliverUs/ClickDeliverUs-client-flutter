import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final WidgetColor widgetColor;
  final WidgetSize widgetSize;
  final double? width;

  const PrimaryBtn(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.widgetColor,
      required this.widgetSize,
      this.width});

  Color _backgroundColor() {
    late Color color;

    switch (widgetColor) {
      case WidgetColor.skyblue:
        color = CustomColor.indigo;
        break;
      case WidgetColor.grey:
        color = CustomColor.whiteGrey;
        break;
    }

    return color;
  }

  Color _foregroundColor() {
    late Color color;

    switch (widgetColor) {
      case WidgetColor.skyblue:
        color = Colors.white;
        break;
      case WidgetColor.grey:
        color = CustomColor.black;
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: widgetSize == WidgetSize.big ? 55 : 45,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _backgroundColor(),
          foregroundColor: _foregroundColor(),
          side: const BorderSide(
            color: Colors.transparent,
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
