import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonHelper {
  static void pushScreen(BuildContext context, Widget widget) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  static void pushRemoveScreen(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
        ((route) => false));
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
      (k, v) => MapEntry<K, V>(k as K, v as V),
    );
  }

  static String telFormat(String tel) {
    return '${tel.substring(0, 3)}-${tel.substring(3, 7)}-${tel.substring(7)}';
  }

  static String? addLeadingZero(int? number) {
    if (number == null) return null;

    if (number >= 0 && number <= 9) {
      return '0$number';
    } else {
      return number.toString();
    }
  }
}
