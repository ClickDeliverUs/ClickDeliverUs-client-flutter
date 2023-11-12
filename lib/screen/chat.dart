import 'package:cd_client/util/constant/custom_color.dart';
import 'package:flutter/material.dart';

class Chatting extends StatelessWidget {
  final String message;

  const Chatting({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/darius.jpeg"),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.whiteGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: const BoxConstraints(
                minHeight: 50,
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 25),
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();
  // TODO: create device database using sqflite

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("채팅"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ListView.builder(
                    reverse: false,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Chatting(message: messages[index]);
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              color: CustomColor.whiteGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        sendMessage();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
        messageController.clear();
      });
    }
  }
}


