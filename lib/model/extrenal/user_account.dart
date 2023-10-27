import 'package:json_annotation/json_annotation.dart';

part 'user_account.g.dart';

@JsonSerializable()
class UserAccount {
  final String uuid;
  final String name;
  final String nickname;
  final String id;
  final String address;
  final String tel;
  // final bool? isAdult;
  final String? accessToken;
  final String? refreshToken;

  UserAccount(
      {required this.uuid,
      required this.name,
      required this.nickname,
      required this.id,
      required this.address,
      required this.tel,
      this.accessToken,
      this.refreshToken});

  UserAccount.init()
      : uuid = "",
        name = "",
        nickname = "",
        id = "",
        address = "",
        tel = "",
        accessToken = "",
        refreshToken = "";

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}
