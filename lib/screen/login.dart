import 'package:cd_client/main.dart';
import 'package:cd_client/widget/button/btn_auth_options.dart';
import 'package:cd_client/widget/input/input_auth.dart';
import 'package:cd_client/widget/input/props/input_data.dart';
import 'package:cd_client/widget/input/props/input_default.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_submit.dart';

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
                    inputDefault: InputDefault(
                      labelText: "아이디",
                      icon: Icons.email,
                    ),
                    inputData: InputData(textEditingController: _idController),
                  ),
                  InputAuth(
                    inputDefault: InputDefault(
                      labelText: "비밀번호",
                      icon: Icons.lock,
                    ),
                    inputData: InputData(
                        textEditingController: _passwordController,
                        obscureText: true),
                  ),
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
