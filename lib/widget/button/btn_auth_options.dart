import 'package:flutter/material.dart';
import '../../util/constant/custom_color.dart';

class BtnAuthOptions extends StatelessWidget {
  final double height;
  final String textL;
  final String textR;
  final VoidCallback onPressedL;
  final VoidCallback onPressedR;

  const BtnAuthOptions(
      {super.key,
      required this.height,
      required this.textL,
      required this.textR,
      required this.onPressedL,
      required this.onPressedR});

  @override
  Widget build(BuildContext context) {
    late double verticalIntent = (height - 20) / 2;
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: onPressedL,
            child: Text(
              textL,
              style: const TextStyle(color: CustomColor.grey),
            ),
          ),
          VerticalDivider(
            color: CustomColor.grey,
            thickness: 1.0,
            width: 10.0,
            indent: verticalIntent,
            endIndent: verticalIntent,
          ),
          TextButton(
            onPressed: onPressedR,
            child: Text(
              textR,
              style: const TextStyle(color: CustomColor.grey),
            ),
          ),
        ],
      ),
    );
  }
}
