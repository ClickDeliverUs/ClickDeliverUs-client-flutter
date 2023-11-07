import 'dart:convert';

import 'package:cd_client/model/extrenal/product.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  final String path = "${dotenv.env['API_SERVER_ADDRESS']}/products";

  Future<List<Product>> getProductByStoreId(int sid) async {
    Response response = await http.get(Uri.parse("$path/search/$sid"));
    if (response.statusCode == 200) {
      List<Product> result = (jsonDecode(response.body) as List<dynamic>)
          .map((v) => Product.fromJson(v))
          .toList();

      return result;
    } else {
      throw Exception("Failed to load product data");
    }
  }
}
