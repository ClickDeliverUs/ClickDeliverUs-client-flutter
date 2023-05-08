import 'package:flutter/material.dart';
import 'package:cd_client/screen/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Flutter Tutorial", home: Home());
  }
}
