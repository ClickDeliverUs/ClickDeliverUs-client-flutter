import 'package:cd_client/main.dart';
import 'package:cd_client/widget/button/btn_auth_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cd_client/bloc/login_bloc.dart';
import 'package:cd_client/util/constant/const_text.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_submit.dart';
import 'package:cd_client/widget/input/input_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void eventFactory(String name, String value) {
    LoginEvent loginEvent;

    switch (name) {
      case ConstText.id:
        loginEvent = LoginIdEvent(value);
        break;
      case ConstText.password:
        loginEvent = LoginPasswordEvent(value);
        break;
      default:
        loginEvent = LoginResetEvent();
        break;
    }

    context.read<LoginBloc>().add(loginEvent);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputLogin(
                    name: ConstText.id,
                    icon: Icons.email,
                    onChanged: eventFactory),
                InputLogin(
                    name: ConstText.password,
                    icon: Icons.lock,
                    onChanged: eventFactory),
                BtnSubmit(
                    name: "로그인",
                    backgroundColor: CustomColor.indigo,
                    foregroundColor: CustomColor.white,
                    onPressed: () {}),
                BtnAuthOptions(
                    height: 40,
                    textL: "아이디 찾기",
                    textR: "비밀번호 찾기",
                    onPressedL: () {},
                    onPressedR: () {})
              ],
            ),
          ),
        ));
  }
}
