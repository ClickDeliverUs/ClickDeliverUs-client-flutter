class RegisterReq {
  final String id;
  final String password;
  final String name;
  final String nickName;
  final String address;
  final String tel;
  final DateTime birth;
  final bool isAdult;

  RegisterReq(
      {required this.id,
      required this.password,
      required this.name,
      required this.nickName,
      required this.address,
      required this.tel,
      required this.birth,
      required this.isAdult});
}
