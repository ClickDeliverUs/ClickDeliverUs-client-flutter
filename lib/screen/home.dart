import 'package:cd_client/apis/store_api.dart';
import 'package:cd_client/model/extrenal/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'storemodal.dart';
import 'showdrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Set<Marker> markers = {};
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
        title: const Text("편의점 검색"),
        centerTitle: true,
      ),
      endDrawer: const ShowDrawer(),
      body: KakaoMap(
        onMapCreated: (controller) {
          markers.add(Marker(
            markerId: UniqueKey().toString(),
            latLng: LatLng(37.459718915969816, 127.12671105754838),
          ));

          markers.add(Marker(
            markerId: UniqueKey().toString(),
            latLng: LatLng(37.45852039661522, 127.12687292453977),
          ));

          markers.add(Marker(
            markerId: UniqueKey().toString(),
            latLng: LatLng(37.45782624200757, 127.12722213247909),
          ));

          setState(() {});
        },
        onMarkerTap: (markerId, latLng, zoomLevel) {
          int idx = markers
              .toList()
              .indexWhere((element) => element.markerId == markerId);
          _modalHandler(stores[idx]);
        },
        markers: markers.toList(),
        center: LatLng(37.459718915969816, 127.12671105754838),
        zoomControl: true,
      ),
    );
  }
}
