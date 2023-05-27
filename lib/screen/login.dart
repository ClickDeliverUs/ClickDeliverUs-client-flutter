import 'package:cd_client/main.dart';
import 'package:cd_client/widget/button/btn_auth_options.dart';
import 'package:cd_client/widget/input/input_auth.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_submit.dart';

import '../model/internal/widget_props/register_input_props.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String id = _idController.text;
      String password = _passwordController.text;
      print('ID: $id');
      print('Password: $password');
    }
  }

  String? idValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '아이디를 입력해 주세요';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해 주세요';
    }
    return null;
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i("build login page");

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("로그인"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Standard.defaultPadding),
          child: SizedBox(
            height: 400,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InputAuth(
                      registerInputProps: RegisterInputProps(
                    textEditingController: _idController,
                    labelText: "아이디",
                    icon: Icons.email,
                  )),
                  InputAuth(
                      registerInputProps: RegisterInputProps(
                    textEditingController: _passwordController,
                    labelText: "비밀번호",
                    icon: Icons.lock,
                    isPassword: true,
                  )),
                  BtnSubmit(
                    name: "로그인",
                    backgroundColor: CustomColor.indigo,
                    foregroundColor: CustomColor.white,
                    onPressed: _submitForm,
                  ),
                  BtnAuthOptions(
                      height: 40,
                      textL: "아이디 찾기",
                      textR: "비밀번호 찾기",
                      onPressedL: () {},
                      onPressedR: () {})
                ],
              ),
            ),
          ),
        ));
  }
}
