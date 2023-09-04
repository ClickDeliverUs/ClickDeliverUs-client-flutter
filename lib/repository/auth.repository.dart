import 'dart:convert';
import 'dart:io' show Platform;
import 'package:cd_client/model/extrenal/user_account.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String serverURL = Platform.isIOS
      ? dotenv.env['IOS_API_SERVER_ADDRESS']!
      : dotenv.env['AND_API_SERVER_ADDRESS']!;

  Future<UserAccount> fetchLogin(String email, String credential) async {
    final response = await http.post(Uri.parse("$serverURL/auth/signin"),
        body: <String, dynamic>{"email": email, "credential": credential});

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return UserAccount.fromJson(responseData);
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
