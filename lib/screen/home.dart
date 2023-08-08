import 'package:cd_client/model/internal/test_store.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:flutter/material.dart';
import 'storemodal.dart';
import 'showdrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TestStore store1 = TestStore(
    name: '편의점 1',
    address: '123',
    open: const TimeOfDay(hour: 9, minute: 0),
    close: const TimeOfDay(hour: 17, minute: 0),
    tel: '010-123-123',
  );
  TestStore store2 = TestStore(
    name: '편의점 2',
    address: '456',
    open: const TimeOfDay(hour: 5, minute: 0),
    close: const TimeOfDay(hour: 22, minute: 0),
    tel: '010-456-456',
  );
  TestStore store3 = TestStore(
    name: '편의점 3',
    address: '789',
    open: const TimeOfDay(hour: 0, minute: 0),
    close: const TimeOfDay(hour: 24, minute: 0),
    tel: '010-789-789',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: CustomColor.indigo,
      ),
      drawer: const ShowDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showStoreModal(context, store1);
                },
                child: const Text('편의점 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  showStoreModal(context, store2);
                },
                child: const Text('편의점 2'),
              ),
              ElevatedButton(
                onPressed: () {
                  showStoreModal(context, store3);
                },
                child: const Text('편의점 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}