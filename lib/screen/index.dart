import 'package:cd_client/screen/register.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/button/btn_auth_options.dart';
import 'package:cd_client/widget/button/btn_oAuth2_login.dart';
import 'package:flutter/material.dart';
import '../util/constant/standard.dart';
import 'login.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Standard.defaultPadding),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                  child: Text(
                "ClickDeliverUs",
                style: TextStyle(fontSize: 25, fontFamily: "KCC-Ganpan"),
              )),
            ),
            const SizedBox(
              height: 300,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnOAuth2Login(socialEnum: SocialEnum.kakao),
                  BtnOAuth2Login(socialEnum: SocialEnum.naver),
                  BtnOAuth2Login(socialEnum: SocialEnum.facebook),
                  BtnOAuth2Login(socialEnum: SocialEnum.google),
                ],
              )),
            ),
            BtnAuthOptions(
                height: 100,
                textL: "아이디로 로그인",
                textR: "아이디로 회원가입",
                onPressedL: () {
                  CommonHelper.navigateScreen(context, const Login());
                },
                onPressedR: () {
                  CommonHelper.navigateScreen(context, const Register());
                })
          ],
        ),
      ),
    ));
  }
}
