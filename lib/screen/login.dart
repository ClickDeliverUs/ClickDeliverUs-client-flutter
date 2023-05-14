import 'package:cd_client/screen/home.dart';
import 'package:cd_client/screen/register.dart';
import 'package:cd_client/util/constant/standard.dart';
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
  String inputId = "";
  String inputPassword = "";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Standard.defaultPadding),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    height: 260,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const Alignment(0.85, 0),
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
                        height: 140,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InputLogin(
                                name: "아이디",
                                onChanged: setInputId,
                              ),
                              InputLogin(
                                name: "비밀번호",
                                onChanged: setInputPassword,
                              ),
                            ]),
                      ),
                      SizedBox(
                          height: 130,
                          child: Center(
                              child: BtnSubmit(
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
                        height: 100,
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                BtnOAuth2Login(
                                  socialEnum: SocialEnum.google,
                                ),
                                BtnOAuth2Login(
                                  socialEnum: SocialEnum.kakao,
                                ),
                                BtnOAuth2Login(
                                  socialEnum: SocialEnum.apple,
                                ),
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
          ),
        ));
  }
}
