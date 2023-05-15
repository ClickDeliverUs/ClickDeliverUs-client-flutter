import 'package:cd_client/bloc/register_bloc.dart';
import 'package:cd_client/model/register_form.dart';
import 'package:cd_client/util/constant/const_text.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../util/constant/standard.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void setIsIdAvailable() {
    String inputId = context.watch<RegisterBloc>().state.registerForm.id;
    bool condition = inputId != "asdf" ? true : false;

    context.read<RegisterBloc>().add(RegisterIsIdAvailableEvent(condition));
  }

  void setId(String value) {
    context.read<RegisterBloc>().add(RegisterIdEvent(value));
  }

  void setPassword(String value) {
    context.read<RegisterBloc>().add(RegisterPasswordEvent(value));
  }

  void setVerifyPassword(String value) {
    context.read<RegisterBloc>().add(RegisterVerifyPasswordEvent(value));
  }

  void setNickName(String value) {
    context.read<RegisterBloc>().add(RegisterNickNameEvent(value));
  }

  void eventHandler(RegisterEvent event) {
    context.read<RegisterBloc>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    final RegisterForm registerForm =
        context.watch<RegisterBloc>().state.registerForm;

    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Standard.defaultPadding),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                                return InputLogin(
                                  name: ConstText.id,
                                  width: 240,
                                  onChanged: setId,
                                );
                              },
                            ),
                            // error here
                            BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (context, state) {
                                return BtnRegisterChecker(
                                    name: "중복확인",
                                    value: state.registerForm.id,
                                    onPressed: setIsIdAvailable);
                              },
                            )
                          ]),
                    ),
                    if (registerForm.isIdAvailable == true)
                      const Text("사용 가능한 아이디입니다.",
                          style: TextStyle(color: CustomColor.indigo))
                    else if (registerForm.isIdAvailable == false)
                      const Text(
                        "중복된 아이디입니다.",
                        style: TextStyle(color: Colors.red),
                      )
                  ],
                )),
            SizedBox(
              height: 180,
              child: Column(children: [
                SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return InputLogin(
                            name: ConstText.password,
                            onChanged: setPassword,
                          );
                        },
                      ),
                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return InputLogin(
                            name: ConstText.verifyPassword,
                            onChanged: setVerifyPassword,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                if (registerForm.password != registerForm.verifyPassword)
                  const Text(
                    "비밀번호가 일치하지 않습니다.",
                    style: TextStyle(color: Colors.red),
                  )
              ]),
            ),
            Container(
              height: 200,
              color: Colors.yellow,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return InputLogin(
                          name: ConstText.nickName,
                          onChanged: setNickName,
                        );
                      },
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
