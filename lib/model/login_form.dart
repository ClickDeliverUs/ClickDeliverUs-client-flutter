class LoginForm {
  final String id;
  final String password;

  LoginForm({required this.id, required this.password});

  LoginForm.init({
    this.id = "",
    this.password = "",
  });

  LoginForm copyWith({
    String? id,
    String? password,
  }) =>
      LoginForm(
        id: id ?? this.id,
        password: password ?? this.password,
      );
}
