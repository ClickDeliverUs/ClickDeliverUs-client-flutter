import 'package:cd_client/util/constant/custom_color.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final int price;
  int count;

  Product(this.name, this.price, this.count);
}

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  List<Product> shoppingItems = [
    Product('상품 1', 1000, 1),
    Product('상품 2', 2000, 1),
    Product('상품 3', 1500, 1),
    Product('상품 4', 500, 1),
    Product('상품 5', 2500, 1),
  ];

  int itemPrice() {
    int totalPrice = 0;
    for (var item in shoppingItems) {
      totalPrice += item.price * item.count;
    }
    return totalPrice;
  }

  void itemPlus(int index) {
    setState(() {
      shoppingItems[index].count++;
    });
  }

  void itemMinus(int index) {
    if (shoppingItems[index].count > 0 ) {
      setState(() {
        shoppingItems[index].count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("장바구니"),
        centerTitle: true,
        backgroundColor: CustomColor.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: shoppingItems.length,
              separatorBuilder: (context, index) => const Divider(thickness: 1),
              itemBuilder: (context, index) {
                final product = shoppingItems[index];
                return ListTile(
                  title: Text(product.name,
                      style: const TextStyle(fontSize: 20)
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('가격: ${product.price}원'),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => itemMinus(index),
                          ),
                          Text('${product.count}개'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => itemPlus(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    '${itemPrice()}원 / 구매하기',
                      style: const TextStyle(fontSize: 20)
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}