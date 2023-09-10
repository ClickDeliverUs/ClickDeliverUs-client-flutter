import 'dart:convert';
import 'package:cd_client/model/extrenal/product_list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  final String path = "${dotenv.env['API_SERVER_ADDRESS']}/products";

  Future<ProductList> getProductByStoreId(int sid) async {
    Response response = await http.get(Uri.parse("$path/search/$sid"));

    if (response.statusCode == 200) {
      Map<String, dynamic> rawResult = jsonDecode(response.body);

      ProductList result = ProductList.fromJson(rawResult);

      return result;
    } else {
      throw Exception("Failed to load product data");
    }
  }
}
