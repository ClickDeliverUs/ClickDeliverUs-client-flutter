import 'package:cd_client/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_oAuth2_login.dart';
import 'package:cd_client/widget/button/btn_submit.dart';
import 'package:cd_client/widget/input/input_login.dart';
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
              const SizedBox(
                  height: 220,
                  child: Align(
                    alignment: Alignment(0, 0.5),
                    child: Text(
                      "ClickDeliverUs",
                      style: TextStyle(
                          color: CustomColor.indigo,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
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
                              name: "email",
                            ),
                            InputLogin(
                              name: "password",
                            ),
                          ]),
                    ),
                    SizedBox(
                        height: 130,
                        child: Center(
                            child: BtnSubmit(
                                width: deviceWidth,
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
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                          255, 211, 95, 74),
                                    ),
                                  )),
                              SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: BtnOAuth2Login(
                                      size: oAuthBtnSize,
                                      socialEnum: SocialEnum.kakao,
                                      backgroundColor: const Color.fromARGB(
                                          255, 243, 226, 78),
                                    ),
                                  )),
                            ]),
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
