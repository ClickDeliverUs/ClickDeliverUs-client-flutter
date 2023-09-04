import 'package:cd_client/model/internal/test_store.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/button/primary_btn.dart';
import 'package:cd_client/widget/button/secondary_btn.dart';
import 'package:cd_client/widget/button/tertiary_btn.dart';
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

  void _modalHandler(TestStore store) {
    showStoreModal(context, store);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            // pop screen
          },
        ),
      ),
      endDrawer: const ShowDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              PrimaryBtn(
                label: "편의점 1",
                onPressed: () {
                  _modalHandler(store1);
                },
                widgetColor: WidgetColor.skyblue,
                widgetSize: WidgetSize.big,
              ),
              const SizedBox(
                height: 10,
              ),
              SecondaryBtn(
                label: "편의점 2",
                onPressed: () {
                  _modalHandler(store2);
                },
                widgetColor: WidgetColor.skyblue,
                widgetSize: WidgetSize.small,
              ),
              const SizedBox(
                height: 10,
              ),
              TertiaryBtn(
                label: "편의점 3",
                onPressed: () {
                  _modalHandler(store3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
