import 'package:flutter/material.dart';

class Product {
  final String name;
  final String status;

  Product(this.name, this.status);
}

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {

  List<Product> orderItems = [
    Product('주문 1','대기중'),
    Product('주문 2','완료'),
    Product('주문 3','완료'),
  ];

  Widget _buildHeader(String text,
      {double fontSize = 18, FontWeight fontWeight = FontWeight.normal}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget _buildInfo(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text),
    );
  }

  Widget _buildDivider() {
    return const Divider(thickness: 3);
  }

  void _showOrder(Product product) {
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
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      _buildHeader('${product.name} (${product.status})',
                          fontSize: 25, fontWeight: FontWeight.bold),
                      _buildInfo('구매 장소 : '),
                      _buildInfo('배달 장소 : '),
                      _buildDivider(),
                      _buildHeader('상품 목록'),
                      _buildDivider(),
                      _buildInfo('상품 금액 : '),
                      _buildInfo('배달 비용 : '),
                      _buildDivider(),
                      _buildHeader('결제 금액 : ',
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
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
                        GestureDetector(
                          onTap: () {
                            _showOrder(product);
                            },
                          child: ListTile(
                            title: Text(
                              product.name,
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(' ${product.status} '),
                              ],
                            ),
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