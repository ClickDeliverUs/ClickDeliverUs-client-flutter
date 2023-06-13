import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';

class StoreIndex extends StatefulWidget {
  const StoreIndex({super.key});

  @override
  State<StoreIndex> createState() => _StoreIndexState();
}

class _StoreIndexState extends State<StoreIndex> {
  final ScrollController _scrollController = ScrollController();
  Color _appbarLeadingColor = Colors.white;
  double _appbarOpacity = 0.0;

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

  Widget _categoryBtn() {
    return GestureDetector(
      onTap: () {
        print("haha");
      },
      child: Container(
        color: Colors.grey,
        margin: const EdgeInsets.all(20.0),
        child: const Center(
          child: Text("alac"),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_appbarLeadingListener);
    _scrollController.addListener(_appbarOpacityListener);
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
            onPressed: () {},
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
                        borderRadius: BorderRadius.circular(
                            Standard.defaultBorderRadius)),
                    child: Image.asset("assets/images/store.jpeg")),
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
                              child: const Text(
                                "GS25 10호관점",
                                style: TextStyle(
                                    fontFamily: "KBO",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            _storeInfo(
                                Icons.location_on, "경기 성남시 수정구 복정동 423-8"),
                            _storeInfo(Icons.schedule, "24시간 영업"),
                            _storeInfo(Icons.phone, "031-123-4567"),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _categoryBtn();
              },
              childCount: 200,
            ),
          ),
        ],
      ),
    );
  }
}
