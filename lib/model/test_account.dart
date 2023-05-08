class TestAccount {
  final int uid;
  final String uuid;
  final String userName;
  final String email;
  final String createdDt;
  final String accessToken;
  final String refreshToken;

  TestAccount(
      {required this.uid,
      required this.uuid,
      required this.userName,
      required this.email,
      required this.createdDt,
      required this.accessToken,
      required this.refreshToken});

  factory TestAccount.fromJson(Map<String, dynamic> json) {
    return TestAccount(
      uid: json["uid"],
      uuid: json["uuid"],
      userName: json["userName"],
      email: json["email"],
      createdDt: json["createdDt"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}
