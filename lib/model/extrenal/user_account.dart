import 'package:json_annotation/json_annotation.dart';

part 'user_account.g.dart';

@JsonSerializable()
class UserAccount {
  final int uid;
  final String userName;
  final String nickName;
  final String email;
  final DateTime birth;
  final String address;
  final String tel;
  final bool isAdult;
  final String? accessToken;
  final String? refreshToken;

  UserAccount(
      {required this.uid,
      required this.userName,
      required this.nickName,
      required this.email,
      required this.birth,
      required this.address,
      required this.tel,
      required this.isAdult,
      this.accessToken,
      this.refreshToken});

  UserAccount.init()
      : uid = 0,
        userName = "",
        nickName = "",
        email = "",
        birth = DateTime.now(),
        address = "",
        tel = "",
        isAdult = false,
        accessToken = "",
        refreshToken = "";

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}
