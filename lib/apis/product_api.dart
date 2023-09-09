import 'dart:convert';

import 'package:cd_client/model/extrenal/product.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  final String path = "${dotenv.env['API_SERVER_ADDRESS']}/products";

  Future<Map<String, List<Product>>> getProductByStoreId(int sid) async {
    Response response = await http.get(Uri.parse("$path/search/$sid"));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      Map<String, dynamic> rawResult = jsonDecode(response.body);
      Map<String, List<Product>> result =
          CommonHelper.mapTypeCasting<String, List<Product>>(rawResult);

      return result;
    } else {
      throw Exception("Failed to load product data");
    }
  }
}
