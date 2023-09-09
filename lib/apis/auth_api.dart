import 'dart:convert';
import 'package:cd_client/main.dart';
import 'package:cd_client/model/extrenal/request/register_req.dart';
import 'package:cd_client/model/extrenal/user_account.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthApi {
  final String path = "${dotenv.env['API_SERVER_ADDRESS']}/auth";

  Future<void> fetchRegister(RegisterReq registerReq) async {
    Response response = await http.post(Uri.parse("$path/signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerReq.toJSon()));

    loggerNoStack.i(response);

    if (response.statusCode == 201) {
      // final bool responseData = jsonDecode(response.body);

      // TODO: response data empty
    } else {
      throw Exception("Failed to load user data");
    }
  }

  Future<UserAccount> fetchLogin(String id, String password) async {
    final response = await http.post(Uri.parse("$path/signin"),
        body: <String, dynamic>{"id": id, "password": password});

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      return UserAccount.fromJson(responseData);
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
