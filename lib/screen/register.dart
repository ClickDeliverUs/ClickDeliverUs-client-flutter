import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/constant/standard.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? isIdAvailable;
  String inputId = "";
  String inputPassword = "";
  String inputPasswordValidation = "";

  void setIsIdAvailable() {
    setState(() {
      inputId != "asdf" ? isIdAvailable = true : isIdAvailable = false;
    });
  }

  void setInputId(String value) {
    setState(() {
      inputId = value;
    });
  }

  void setInputPassword(String value) {
    setState(() {
      inputPassword = value;
    });
  }

  void setInputPasswordValidation(String value) {
    setState(() {
      inputPasswordValidation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            InputLogin(
                              name: "아이디",
                              width: 240,
                              onChanged: setInputId,
                            ),
                            BtnRegisterChecker(
                                name: "중복확인",
                                value: inputId,
                                onPressed: setIsIdAvailable)
                          ]),
                    ),
                    if (isIdAvailable == true)
                      const Text("사용 가능한 아이디입니다.",
                          style: TextStyle(color: CustomColor.indigo))
                    else if (isIdAvailable == false)
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
                      InputLogin(
                        name: "비밀번호",
                        onChanged: setInputPassword,
                      ),
                      InputLogin(
                        name: "비밀번호 확인",
                        onChanged: setInputPasswordValidation,
                      ),
                    ],
                  ),
                ),
                if (inputPassword != inputPasswordValidation)
                  const Text(
                    "비밀번호가 일치하지 않습니다.",
                    style: TextStyle(color: Colors.red),
                  )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
