import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  String _getSocialIcon(SocialEnum socialEnum) {
    switch (socialEnum) {
      case SocialEnum.google:
        return "assets/icons/google.svg";
      case SocialEnum.kakao:
        return "assets/icons/kakao.svg";
      case SocialEnum.apple:
        return "assets/icons/apple.svg";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print(widget.socialEnum);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(widget.size, widget.size),
          shape: const CircleBorder(),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        child: Center(
            child: SvgPicture.asset(
          _getSocialIcon(widget.socialEnum),
          width: widget.size,
        )));
  }
}
