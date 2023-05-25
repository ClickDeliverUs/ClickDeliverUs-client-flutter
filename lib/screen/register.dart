import 'package:cd_client/util/constant/const_text.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_login.dart';
import 'package:flutter/material.dart';
import '../util/constant/custom_color.dart';
import '../util/constant/standard.dart';
import '../main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String id = "";
  String password = "";
  String passwordVerify = "";
  String nickName = "";
  bool? isIdAvailable;

  void setId(String value) {
    setState(() {
      id = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void setPasswordVerify(String value) {
    setState(() {
      passwordVerify = value;
    });
  }

  void setNickName(String value) {
    setState(() {
      nickName = value;
    });
  }

  void idValidation() {
    setState(() {
      isIdAvailable = id != "asdf" ? true : false;
    });
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
                              onChanged: setId,
                            ),
                            BtnRegisterChecker(
                                name: "중복확인",
                                value: id,
                                onPressed: idValidation)
                          ]),
                    ),
                    (isIdAvailable == true)
                        ? const Text(
                            "사용 가능한 아이디입니다.",
                            style: TextStyle(color: CustomColor.indigo),
                          )
                        : (isIdAvailable == false)
                            ? const Text(
                                "중복된 아이디입니다.",
                                style: TextStyle(color: Colors.red),
                              )
                            : const SizedBox()
                  ],
                )),
            SizedBox(
              height: 180,
              child: Column(children: [
                SizedBox(
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputLogin(
                        name: ConstText.password,
                        icon: Icons.lock,
                        onChanged: setPassword,
                      ),
                      InputLogin(
                        name: ConstText.verifyPassword,
                        icon: Icons.check,
                        onChanged: setPasswordVerify,
                      ),
                    ],
                  ),
                ),
                (password != passwordVerify)
                    ? const Text(
                        "비밀번호가 일치하지 않습니다.",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox()
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
                      onChanged: setNickName,
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
