import 'package:cd_client/screen/register.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/molecules/auth_option_row.dart';
import 'package:cd_client/widget/atoms/button/oAuth2_btn.dart';
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
                ),
              ),
            ),
            const SizedBox(
              height: 180,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OAuth2Btn(socialEnum: SocialEnum.kakao),
                    OAuth2Btn(socialEnum: SocialEnum.google),
                  ],
                ),
              ),
            ),
            AuthOptionRow(
              height: 100,
              textL: "아이디로 로그인",
              textR: "아이디로 회원가입",
              onPressedL: () {
                CommonHelper.pushScreen(context, const Login());
              },
              onPressedR: () {
                CommonHelper.pushScreen(context, const Register());
              },
            )
          ],
        ),
      ),
    ));
  }
}
