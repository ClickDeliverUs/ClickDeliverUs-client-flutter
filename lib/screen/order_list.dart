import 'package:flutter/material.dart';

class Product {
  final String name;

  Product(this.name);
}

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {

  List<Product> orderItems = [
    Product('주문 1'),
    Product('주문 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("주문 내역"),
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
                        ListTile(
                          title: Text(
                            product.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('대기중'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}