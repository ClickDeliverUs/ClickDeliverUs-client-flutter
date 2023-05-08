class UserAccount {
  final int uid;
  final String userName;
  final String nickName;
  final String email;
  final String birth;
  final String address;
  final String tel;
  final bool isAdult;
  final String accessToken;
  final String refreshToken;

  UserAccount(
      {required this.uid,
      required this.userName,
      required this.nickName,
      required this.email,
      required this.birth,
      required this.address,
      required this.tel,
      required this.isAdult,
      required this.accessToken,
      required this.refreshToken});

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      uid: json["uid"],
      userName: json["userName"],
      nickName: json["nickName"],
      email: json["email"],
      birth: json["birth"],
      address: json["address"],
      tel: json["tel"],
      isAdult: json["isAdult"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}
