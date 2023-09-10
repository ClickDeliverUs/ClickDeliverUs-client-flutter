// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      sid: json['sid'] as int,
      cvsName: json['cvsName'] as String,
      cAddress: json['cAddress'] as String,
      phone: json['phone'] as String,
      cOpen: Map<String, int>.from(json['cOpen'] as Map),
      cClose: Map<String, int>.from(json['cClose'] as Map),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'sid': instance.sid,
      'cvsName': instance.cvsName,
      'cAddress': instance.cAddress,
      'phone': instance.phone,
      'cOpen': instance.cOpen,
      'cClose': instance.cClose,
    };
