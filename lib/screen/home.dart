import 'package:flutter/material.dart';
import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/widget/button/btn_oAuth2_login.dart';
import 'package:cd_client/widget/button/btn_submit.dart';
import 'package:cd_client/widget/input/input_login.dart';

import '../repository/auth.repository.dart';

class Home extends StatelessWidget {
  final double _widgetWidth = 320;

  const Home({super.key});

  void printUser() async {
    var user = await AuthRepository().getUser("test@gmail.com", "test");
    print(user.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                  height: 260,
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
                      width: _widgetWidth,
                      height: 140,
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
                        height: 150,
                        child: Center(
                            child: BtnSubmit(
                                width: _widgetWidth,
                                foregroundColor: Colors.white,
                                backgroundColor: CustomColor.indigo,
                                onPress: printUser))),
                    const Expanded(
                        child: Center(
                      child: Text(
                        "또는",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    )),
                    SizedBox(
                      height: 230,
                      child: Align(
                        alignment: const Alignment(0, 0.6),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: BtnOAuth2Login(
                                      width: _widgetWidth,
                                      name: "구글로 로그인",
                                      backgroundColor: const Color.fromARGB(
                                          255, 211, 95, 74),
                                    ),
                                  )),
                              SizedBox(
                                  height: 70,
                                  child: Center(
                                    child: BtnOAuth2Login(
                                      width: _widgetWidth,
                                      name: "카카오로 로그인",
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
