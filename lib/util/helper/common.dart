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
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<DateTime?> datePicker(
      BuildContext context, int firstDate, int lastDate) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(firstDate),
      lastDate: DateTime(lastDate),
    );
  }

  static Map<K, V> mapTypeCasting<K, V>(dynamic m) {
    return (m as Map<String, dynamic>).map<K, V>(
      // TODO: fix type casting
      (k, v) => MapEntry<K, V>(k as K, v as V),
    );
  }
}
