import 'package:flutter/material.dart';
import 'info.dart';
import 'index.dart';

class ShowDrawer extends StatelessWidget {
  const ShowDrawer({Key? key}) : super(key: key);

  Widget buildList(IconData icon, String title, Function() onTap) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black)],
        ),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/store.jpeg"),
                  ),
                ),
                const SizedBox(height: 5),
                const Text("Name",
                    style: TextStyle(color: Colors.black, fontSize: 25)),
                const Text("@id",
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
                const SizedBox(height: 30),
                buildList(Icons.person_outline, "내 정보", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Info()),
                  );
                }),
                buildList(Icons.star, "이벤트", () {}),
                buildList(Icons.settings, "설정", () {}),
                buildList(Icons.question_mark, "도움말", () {}),
                buildList(Icons.logout, "로그아웃", () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("로그아웃"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Index(),
                                ),
                              );
                            },
                            child: const Text("예"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("아니오"),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}