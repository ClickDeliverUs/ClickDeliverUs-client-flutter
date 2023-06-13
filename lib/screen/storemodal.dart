import 'package:cd_client/screen/store_index.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/model/internal/test_store.dart';

void showStoreModal(BuildContext context, TestStore store) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                    margin: const EdgeInsets.all(20),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(store.name),
                      subtitle: Text(store.address),
                    ),
                  ),
                ],
              ),
              ListTile(title: Text('Tel: ${store.tel}')),
              ListTile(title: Text('Open: ${store.open.format(context)}')),
              ListTile(title: Text('Close: ${store.close.format(context)}')),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StoreIndex()));
                },
                child: const Text('주문'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
