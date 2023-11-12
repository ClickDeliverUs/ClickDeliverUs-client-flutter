import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool firstSwitch = true;
  bool secondSwitch = true;
  bool thirdSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('알림'),
              trailing: Switch(
                value: firstSwitch,
                onChanged: (value) {
                  setState(() {
                    firstSwitch = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('소리'),
              trailing: Switch(
                value: secondSwitch,
                onChanged: (value) {
                  setState(() {
                    secondSwitch = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('진동'),
              trailing: Switch(
                value: thirdSwitch,
                onChanged: (value) {
                  setState(() {
                    thirdSwitch = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}