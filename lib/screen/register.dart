import 'package:cd_client/bloc/register_bloc.dart';
import 'package:cd_client/util/constant/const_text.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../util/constant/custom_color.dart';
import '../util/constant/standard.dart';
import '../main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void setIsIdAvailable(String inputId) {
    bool condition = inputId != "asdf" ? true : false;

    context.read<RegisterBloc>().add(RegisterIsIdAvailableEvent(condition));
  }

  void eventFactory(String name, String value) {
    RegisterEvent registerEvent;

    switch (name) {
      case ConstText.id:
        registerEvent = RegisterIdEvent(value);
        break;
      case ConstText.password:
        registerEvent = RegisterPasswordEvent(value);
        break;
      case ConstText.verifyPassword:
        registerEvent = RegisterVerifyPasswordEvent(value);
        break;
      case ConstText.nickName:
        registerEvent = RegisterNickNameEvent(value);
        break;
      default:
        registerEvent = RegisterResetEvent();
        break;
    }

    context.read<RegisterBloc>().add(registerEvent);
  }

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i("build register page");
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
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
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InputLogin(
                              name: ConstText.id,
                              width: 240,
                              icon: Icons.account_circle,
                              onChanged: eventFactory,
                            ),
                            BlocSelector<RegisterBloc, RegisterState, String>(
                              selector: (state) => state.registerForm.id,
                              builder: (context, state) {
                                return BtnRegisterChecker(
                                    name: "중복확인",
                                    value: state,
                                    onPressed: () => setIsIdAvailable(state));
                              },
                            )
                          ]),
                    ),
                    BlocSelector<RegisterBloc, RegisterState, bool?>(
                      selector: (state) => state.registerForm.isIdAvailable,
                      builder: (context, state) {
                        if (state == true) {
                          return const Text(
                            "사용 가능한 아이디입니다.",
                            style: TextStyle(color: CustomColor.indigo),
                          );
                        } else if (state == false) {
                          return const Text(
                            "중복된 아이디입니다.",
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
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
                      InputLogin(
                        name: ConstText.password,
                        icon: Icons.lock,
                        onChanged: eventFactory,
                      ),
                      InputLogin(
                        name: ConstText.verifyPassword,
                        icon: Icons.check,
                        onChanged: eventFactory,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state.registerForm.password !=
                        state.registerForm.verifyPassword) {
                      return const Text(
                        "비밀번호가 일치하지 않습니다.",
                        style: TextStyle(color: Colors.red),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ]),
            ),
            Container(
              height: 200,
              color: Colors.yellow,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputLogin(
                      name: ConstText.nickName,
                      icon: Icons.face,
                      onChanged: eventFactory,
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
