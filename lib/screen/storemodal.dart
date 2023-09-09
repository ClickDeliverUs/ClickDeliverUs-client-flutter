import 'package:cd_client/model/extrenal/store.dart';
import 'package:cd_client/screen/store_index.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:flutter/material.dart';

Widget _storeInfo(IconData icon, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontFamily: "KBO",
          ),
        )
      ],
    ),
  );
}

void showStoreModal(BuildContext context, Store store) {
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
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/images/store.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            store.cvsName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Text(
                                  "open",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _storeInfo(Icons.location_on, store.cAddress),
                        _storeInfo(
                          Icons.schedule,
                          '${store.cOpen["hour"]} : ${store.cOpen["minute"]}'
                          ' ~ ${store.cClose["hour"]} : ${store.cClose["minute"]}',
                        ),
                        _storeInfo(Icons.phone, store.phone),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 200,
                  height: 30,
                  child: PrimaryBtn(
                    label: "주문",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StoreIndex(store: store)),
                      );
                    },
                    widgetColor: WidgetColor.skyblue,
                    widgetSize: WidgetSize.big,
                    width: double.infinity,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
