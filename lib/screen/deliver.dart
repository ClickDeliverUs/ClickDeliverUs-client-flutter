import 'package:flutter/material.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';

class Product {
  final String name;
  final String place;

  Product(this.name, this.place);
}

class Deliver extends StatefulWidget {
  const Deliver({Key? key}) : super(key: key);

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  List<Product> orderItems = [
    Product('주문 1', '1호관'),
    Product('주문 2', '2호관'),
    Product('주문 3', '3호관'),
    Product('주문 4', '4호관'),
  ];

  void _showDeliver(Product product) {
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
                Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                       const Text(
                        '상세 정보',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        '편의점: 편의점',
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '주문 상품: 상품',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '배송 위치: ${product.place}',
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
                      label: "배달 하기",
                      onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("배달 요청"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                final product = orderItems[index];
                return Card(
                  elevation: 3,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _showDeliver(product);
                        },
                        child: ListTile(
                          title: Text(
                            product.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('배송 위치: ${product.place}'),
                              TextButton(
                                onPressed: () {
                                  _showDeliver(product);
                                },
                                child: const Text('확인'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}