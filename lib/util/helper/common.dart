import 'package:flutter/material.dart';

class CommonHelper {
  static void navigateScreen(BuildContext context, Widget widget) {
    Navigator.push<void>(context,
        MaterialPageRoute<void>(builder: (BuildContext context) => widget));
  }
}
