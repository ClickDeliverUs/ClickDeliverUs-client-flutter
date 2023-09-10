import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  final int sid;
  final String cvsName;
  final String cAddress;
  final String phone;
  final Map<String, int> cOpen;
  final Map<String, int> cClose;

  Store(
      {required this.sid,
      required this.cvsName,
      required this.cAddress,
      required this.phone,
      required this.cOpen,
      required this.cClose});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
