class RegisterForm {
  final String id;
  final String password;
  final String verifyPassword;
  final String nickName;
  final bool? isIdAvailable;

  RegisterForm(
      {required this.id,
      required this.password,
      required this.verifyPassword,
      required this.nickName,
      required this.isIdAvailable});

  RegisterForm.init(
      {this.id = "",
      this.password = "",
      this.verifyPassword = "",
      this.nickName = "",
      this.isIdAvailable});

  RegisterForm copyWith(
          {String? id,
          String? password,
          String? verifyPassword,
          String? nickName,
          bool? isIdAvailable}) =>
      RegisterForm(
        id: id ?? this.id,
        password: password ?? this.password,
        verifyPassword: verifyPassword ?? this.verifyPassword,
        nickName: nickName ?? this.nickName,
        isIdAvailable: isIdAvailable ?? this.isIdAvailable,
      );
}
