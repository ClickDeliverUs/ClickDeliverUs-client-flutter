import 'package:cd_client/bloc/user_acoount_bloc.dart';
import 'package:cd_client/screen/home.dart';
import 'package:cd_client/screen/register.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/widget/molecules/auth_option_row.dart';
import 'package:cd_client/widget/atoms/button/oAuth2_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../util/constant/standard.dart';
import 'login.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<UserAccountBloc, UserAccountState>(
      listener: (context, state) {
        if (state.isLoggedIn) {
          CommonHelper.pushScreen(context, const Home());
        }
      },
      child: SafeArea(
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
              SizedBox(
                height: 180,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OAuth2Btn(
                        socialEnum: SocialEnum.kakao,
                        onPressed: () {
                          context
                              .read<UserAccountBloc>()
                              .add(KakaoLoginEvent());
                        },
                      ),
                      const OAuth2Btn(socialEnum: SocialEnum.google),
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
      ),
    ));
  }
}
