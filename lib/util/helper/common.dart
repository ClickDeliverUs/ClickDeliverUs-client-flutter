import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonHelper {
  static void navigateScreen(BuildContext context, Widget widget) {
    Navigator.push<void>(context,
        MaterialPageRoute<void>(builder: (BuildContext context) => widget));
  }

  static String dateFormatFull(DateTime? date) {
    String formattedDate =
        date != null ? DateFormat('yyyy-MM-dd').format(date) : "";

    return formattedDate;
  }

  static void showSnackBar(BuildContext context, String text) {
    var snackBar = SnackBar(
      content: Center(
          child: Text(
        text,
        style: const TextStyle(fontFamily: "KBO", fontSize: 14),
      )),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
