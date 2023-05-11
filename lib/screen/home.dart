import 'package:cd_client/model/test_account.dart';
import 'package:cd_client/repository/auth.repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int num = 0;
  String? name = null;

  void plus() {
    setState(() {
      num++;
    });
  }

  void minus() {
    setState(() {
      num--;
    });
  }

  void reset() {
    setState(() {
      num = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    void getUserStatus() async {
      AuthRepository authRepository = AuthRepository();
      TestAccount testAccount =
          await authRepository.fetchLogin("test@gmail.com", "test");
      setState(() {
        name = testAccount.accessToken;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("counter app"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              child: Column(
            children: [
              Text("$num", style: TextStyle(fontSize: 50)),
              if (name != null) Text("$name", style: TextStyle(fontSize: 20))
            ],
          )),
          SizedBox(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 40),
                      ),
                      onPressed: plus),
                  FloatingActionButton(
                      child: const Text("-", style: TextStyle(fontSize: 40)),
                      onPressed: minus),
                  FloatingActionButton(
                      child: const Text("0", style: TextStyle(fontSize: 40)),
                      onPressed: getUserStatus)
                ]),
          ),
        ],
      )),
    );
  }
}
