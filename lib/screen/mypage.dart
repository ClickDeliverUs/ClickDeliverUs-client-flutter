import 'package:flutter/material.dart';
import 'package:cd_client/widget/atoms/button/tertiary_btn.dart';
import 'order_list.dart';
import 'chat.dart';
import 'index.dart';
import 'info.dart';
import 'setting.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이 페이지"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10.0,
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
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'ClickDeliverUs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                _buildIconCard(Icons.home, "편의점", () {}),
                _buildIconCard(Icons.favorite, "상품", () {}),
                _buildIconCard(Icons.person, "정보 수정", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Info()),
                  );
                }),
                _buildIconCard(Icons.list, "주문 내역", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderList()),
                  );
                }),
                _buildIconCard(Icons.chat, "채팅", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Chat()),
                  );
                }),
                _buildIconCard(Icons.settings, "설정", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                }),
                _buildIconCard(Icons.add, " ", () {}),
                _buildIconCard(Icons.add, " ", () {}),
                _buildIconCard(Icons.add, " ", () {}),
              ],
            )
          ),
          TertiaryBtn(
            label: "test",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Test"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("확인"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildIconCard(IconData iconData, String text, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
          Text(text),
        ],
      ),
    ),
  );
}







