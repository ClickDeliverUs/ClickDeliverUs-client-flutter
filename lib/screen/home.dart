import 'package:cd_client/apis/store_api.dart';
import 'package:cd_client/model/extrenal/store.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'storemodal.dart';
import 'showdrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Store> stores = [];

  void _modalHandler(Store store) {
    showStoreModal(context, store);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      List<Store> storeData = await context.read<StoreApi>().fetchStoreList();

      setState(() {
        stores = storeData;
      });
    });
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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(stores.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PrimaryBtn(
                  label: "편의점 $index",
                  onPressed: () {
                    _modalHandler(stores[index]);
                  },
                  widgetColor: WidgetColor.skyblue,
                  widgetSize: WidgetSize.big,
                ),
              );
            })),
      ),
    );
  }
}
