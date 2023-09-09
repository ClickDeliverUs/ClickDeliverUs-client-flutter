import 'package:cd_client/util/helper/common.dart';

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

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      sid: json["sid"],
      cvsName: json["cvsName"],
      cAddress: json["cAddress"],
      phone: json["phone"],
      cOpen: CommonHelper.mapTypeCasting<String, int>(json["cOpen"]),
      cClose: CommonHelper.mapTypeCasting<String, int>(json["cClose"]),
    );
  }
}
