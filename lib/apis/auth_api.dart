import 'dart:convert';
import 'package:cd_client/exceptions/network_exception.dart';
import 'package:cd_client/exceptions/request_canceled_exception.dart';
import 'package:cd_client/model/extrenal/request/register_req.dart';
import 'package:cd_client/model/extrenal/user_account.dart';
import 'package:cd_client/util/logget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class AuthApi {
  final String path = "${dotenv.env['API_SERVER_ADDRESS']}/auth";

  Future<bool> fetchRegister(RegisterReq registerReq) async {
    Response response = await http.post(Uri.parse("$path/signup"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerReq.toJSon()));

    if (response.statusCode == 201) {
      return true;
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

  Future<void> fetchKakaoLogin() async {
    bool isKakaoInstalled = await isKakaoTalkInstalled();
    OAuthToken oAuthToken;

    try {
      oAuthToken = isKakaoInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      print(oAuthToken.accessToken);
    } catch (e) {
      print(e);
      throw Error();
    }

    Response response = await post(Uri.parse("$path/kakao-login"), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${oAuthToken.accessToken}',
    });

    if (response.statusCode == 201) {
      UserAccount userAccount = UserAccount.fromJson(jsonDecode(response.body));

      loggerNoStack.i(userAccount);
    } else {
      throw NetworkException();
    }
  }
}
