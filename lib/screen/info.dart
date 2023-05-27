import 'package:cd_client/util/constant/custom_color.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _HomeState();
}

class _HomeState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Info"),
          centerTitle: true,
          backgroundColor: CustomColor.indigo,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);},
          )),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30.0),
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                color: Colors.grey,
                margin: const EdgeInsets.all(20),
              ),
              const SizedBox(width: 10.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text("uid"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ListTile(
            title: const Text("Nickname"),
            subtitle: const Text("Nick"),
            trailing: const Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Email"),
            subtitle: const Text("email@.mail.com"),
            trailing: const Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Address"),
            subtitle: const Text("1234567"),
            trailing: const Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Birth"),
            subtitle: const Text("2000-01-01"),
            trailing: const Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
