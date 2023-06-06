import 'package:flutter/material.dart';

class TestStore {
  final String name;
  final String address;
  final TimeOfDay open;
  final TimeOfDay close;
  final String tel;

  TestStore(
      {required this.name,
      required this.address,
      required this.open,
      required this.close,
      required this.tel});
}
