class RegisterReq {
  final String id;
  final String password;
  final String name;
  final String nickName;
  final String address;
  final String tel;
  final String birth;
  final bool gender;
  final bool isAdult;

  RegisterReq(
      {required this.id,
      required this.password,
      required this.name,
      required this.nickName,
      required this.address,
      required this.tel,
      required this.birth,
      required this.gender,
      required this.isAdult});

  Map<String, dynamic> toJSon() {
    return {
      "id": id,
      "password": password,
      "name": name,
      "nickName": nickName,
      "address": address,
      "tel": tel,
      "birth": birth,
      "gender": gender,
      "isAdult": isAdult
    };
  }

  factory RegisterReq.fromJson(Map<String, dynamic> json) {
    return RegisterReq(
        id: json["id"],
        password: json["password"],
        name: json["name"],
        nickName: json["nickName"],
        address: json["address"],
        tel: json["tel"],
        birth: json["birth"],
        gender: json["gender"],
        isAdult: json["isAdult"]);
  }
}
