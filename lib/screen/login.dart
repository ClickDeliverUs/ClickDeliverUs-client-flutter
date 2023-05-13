import 'package:cd_client/screen/home.dart';
import 'package:cd_client/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_oAuth2_login.dart';
import 'package:cd_client/widget/button/btn_submit.dart';
import 'package:cd_client/widget/input/input_login.dart';
import 'package:flutter_svg/svg.dart';
import '../util/helper/enum.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width * 0.8;
    double oAuthBtnSize = 50;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const Alignment(0.75, 0),
                        child: SvgPicture.asset("assets/icons/main_icon.svg"),
                      ),
                      const Text(
                        "ClickDeliverUs",
                        style: TextStyle(
                            color: CustomColor.indigo,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: deviceWidth,
                      height: 150,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            InputLogin(
                              name: "아이디",
                            ),
                            InputLogin(
                              name: "비밀번호",
                            ),
                          ]),
                    ),
                    SizedBox(
                        height: 130,
                        child: Center(
                            child: BtnSubmit(
                                width: deviceWidth,
                                name: "로그인",
                                foregroundColor: Colors.white,
                                backgroundColor: CustomColor.indigo,
                                onPress: () {
                                  Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const Home()));
                                }))),
                    const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            "또는",
                            style: TextStyle(fontSize: 14),
                          ),
                        )),
                    SizedBox(
                      width: deviceWidth,
                      height: 100,
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: BtnOAuth2Login(
                                      size: oAuthBtnSize,
                                      socialEnum: SocialEnum.google,
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  )),
                              SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: BtnOAuth2Login(
                                      size: oAuthBtnSize,
                                      socialEnum: SocialEnum.kakao,
                                      backgroundColor: const Color.fromARGB(
                                          255, 251, 233, 80),
                                    ),
                                  )),
                              SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: BtnOAuth2Login(
                                      size: oAuthBtnSize,
                                      socialEnum: SocialEnum.apple,
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  )),
                            ]),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("계정이 없으신가요?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const Register()));
                                },
                                child: const Text("가입하기"))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
