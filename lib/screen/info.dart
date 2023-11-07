import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String nickname = "Nick";
  String birth = "2000-01-01";
  String address = "1234567";
  String email = "email@.mail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내 정보"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/darius.jpeg"),
                      ),
                    ),
                    const SizedBox(width: 50.0),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "NAME",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          Text("@uid1234"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildInfo("닉네임", nickname, onTap: () {
              _showTextInputDialog("닉네임", nickname, (newText) {
                setState(() {
                  nickname = newText;
                });
              });
            }),
            buildInfo("생일", birth, onTap: () {
              _showTextInputDialog("생일", birth, (newText) {
                setState(() {
                  birth = newText;
                });
              });
            }),
            buildInfo("주소", address, onTap: () {
              _showTextInputDialog("주소", address, (newText) {
                setState(() {
                  address = newText;
                });
              });
            }),
            buildInfo("메일", email, onTap: () {
              _showTextInputDialog("메일", email, (newText) {
                setState(() {
                  email = newText;
                });
              });
            }),
          ],
        ),
      ),
    );
  }

  void _showTextInputDialog(String title, String initialValue, Function(String) onTextSubmitted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newText = initialValue;
        return AlertDialog(
          title: Text(" $title "),
          content: TextField(
            onChanged: (text) {
              newText = text;
            },
            controller: TextEditingController(text: initialValue),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("취소"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("저장"),
              onPressed: () {
                onTextSubmitted(newText);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

Widget buildInfo(String title, String subtitle, {onTap}) {
  return Card(
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    ),
  );
}