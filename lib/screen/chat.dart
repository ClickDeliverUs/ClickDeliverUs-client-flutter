import 'package:cd_client/util/constant/custom_color.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // TODO: create device database using sqflite

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text("asdf"),
                ),
              ),
            ),
            Container(
              height: 60,
              color: CustomColor.whiteGrey,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.send),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
