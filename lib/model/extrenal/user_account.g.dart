// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) => UserAccount(
      uuid: json['uuid'] as String,
      name: json['name'] as String?,
      nickname: json['nickname'] as String,
      id: json['id'] as String,
      address: json['address'] as String?,
      tel: json['tel'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$UserAccountToJson(UserAccount instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'nickname': instance.nickname,
      'id': instance.id,
      'address': instance.address,
      'tel': instance.tel,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
