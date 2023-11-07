import 'dart:convert';
import 'package:cd_client/model/extrenal/store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class StoreApi {
  final String path = "${dotenv.env['API_SERVER_ADDRESS']}/stores";

  Future<List<Store>> fetchStoreList() async {
    Response response = await http.get(Uri.parse("$path/cvstore"));
    if (response.statusCode == 200) {
      List<dynamic> rawResult = jsonDecode(response.body);

      List<Store> result = rawResult.map((m) {
        return Store.fromJson(m);
      }).toList();

      return result;
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
