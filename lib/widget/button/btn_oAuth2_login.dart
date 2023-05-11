import 'package:flutter/material.dart';
import '../../util/helper/enum.dart';

class BtnOAuth2Login extends StatefulWidget {
  final double size;
  final SocialEnum socialEnum;
  final Color backgroundColor;

  const BtnOAuth2Login(
      {super.key,
      required this.size,
      required this.socialEnum,
      required this.backgroundColor});

  @override
  State<BtnOAuth2Login> createState() => _BtnOAuth2LoginState();
}

class _BtnOAuth2LoginState extends State<BtnOAuth2Login> {
  Widget _getSocialIcon(SocialEnum socialEnum) {
    switch (socialEnum) {
      case SocialEnum.google:
        return const Icon(Icons.g_mobiledata);
      case SocialEnum.kakao:
        return const Icon(Icons.key);
      case SocialEnum.naver:
        return const Icon(Icons.nature);
      default:
        return const Icon(Icons.question_mark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            shadowColor: Colors.transparent,
            foregroundColor: Colors.white,
            backgroundColor: widget.backgroundColor,
          ),
          child: _getSocialIcon(widget.socialEnum)),
    );
  }
}
