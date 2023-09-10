// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      uid: json['uid'] as int,
      userName: json['userName'] as String,
      nickName: json['nickName'] as String,
      email: json['email'] as String,
      birth: DateTime.parse(json['birth'] as String),
      address: json['address'] as String,
      tel: json['tel'] as String,
      isAdult: json['isAdult'] as bool,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'nickName': instance.nickName,
      'email': instance.email,
      'birth': instance.birth.toIso8601String(),
      'address': instance.address,
      'tel': instance.tel,
      'isAdult': instance.isAdult,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
