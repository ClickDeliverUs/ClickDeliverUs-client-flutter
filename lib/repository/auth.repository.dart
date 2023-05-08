import 'package:cd_client/datasource/auth_provide.dart';
import 'package:cd_client/model/test_account.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._internal();
  final AuthProvide authProvide = AuthProvide();

  AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }

  Future<TestAccount> getUser(String email, String credential) {
    return authProvide.fetchLogin(email, credential);
  }
}
