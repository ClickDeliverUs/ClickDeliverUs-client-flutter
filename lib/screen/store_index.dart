import 'package:cd_client/apis/product_api.dart';
import 'package:cd_client/model/extrenal/product.dart';
import 'package:cd_client/model/extrenal/store.dart';
import 'package:cd_client/screen/shopping.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:cd_client/widget/atoms/btn_product.dart';
import 'package:cd_client/widget/atoms/button/btn_product_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreIndex extends StatefulWidget {
  final Store store;

  const StoreIndex({super.key, required this.store});

  @override
  State<StoreIndex> createState() => _StoreIndexState();
}

class _StoreIndexState extends State<StoreIndex> {
  final ScrollController _scrollController = ScrollController();
  Color _appbarLeadingColor = Colors.white;
  double _appbarOpacity = 0.0;
  List<Product> productList = [];

  void _appbarLeadingListener() {
    setState(() {
      _appbarLeadingColor =
          _scrollController.position.pixels > 50 ? Colors.black : Colors.white;
    });
  }

  void _appbarOpacityListener() {
    if (_scrollController.position.pixels < 100 &&
        _scrollController.position.pixels >= 0) {
      setState(() {
        _appbarOpacity = _scrollController.position.pixels / 100;
      });
    }
  }

  Widget _storeInfo(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text(text,
              style: const TextStyle(
                fontFamily: "KBO",
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_appbarLeadingListener);
    _scrollController.addListener(_appbarOpacityListener);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<String, List<Product>> r = await context
          .read<ProductApi>()
          .getProductByStoreId(widget.store.sid);

      List<List<Product>> rawList = r.values.toList();

      List<Product> l = [];

      for (List<Product> sublist in rawList) {
        l.addAll(sublist);
      }

      setState(() {
        productList = l;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_appbarOpacityListener);
    _scrollController.removeListener(_appbarLeadingListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color.fromRGBO(255, 255, 255, _appbarOpacity),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _appbarLeadingColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: _appbarLeadingColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: _appbarLeadingColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Shopping()),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Standard.defaultBorderRadius)),
                  child: Image.asset("assets/images/store.jpeg"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Standard.defaultPadding),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 30),
                              child: Text(
                                widget.store.cvsName,
                                style: const TextStyle(
                                    fontFamily: "KBO",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            _storeInfo(
                                Icons.location_on, widget.store.cAddress),
                            _storeInfo(Icons.schedule, "24시간 영업"),
                            _storeInfo(Icons.phone, widget.store.phone),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            BtnProductCategory(title: "전체"),
                            BtnProductCategory(title: "전체"),
                            BtnProductCategory(title: "전체"),
                            BtnProductCategory(title: "전체"),
                            BtnProductCategory(title: "전체"),
                            BtnProductCategory(title: "전체"),
                            BtnProductCategory(title: "전체"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (productList.isNotEmpty)
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductContainer(
                    product: productList[index],
                  );
                },
                childCount: 200,
              ),
            ),
        ],
      ),
    );
  }
}
