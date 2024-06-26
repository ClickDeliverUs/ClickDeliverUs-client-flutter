import 'package:cd_client/util/constant/custom_color.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../util/helper/enum.dart';

class OAuth2Btn extends StatefulWidget {
  final SocialEnum socialEnum;
  final void Function()? onPressed;

  const OAuth2Btn({super.key, required this.socialEnum, this.onPressed});

  @override
  State<OAuth2Btn> createState() => _OAuth2BtnState();
}

class _OAuth2BtnState extends State<OAuth2Btn> {
  late String _socialIcon;
  late String _title;
  late Color _backgroundColor;
  late Color _fontColor;

  @override
  void initState() {
    super.initState();

    switch (widget.socialEnum) {
      case SocialEnum.google:
        _socialIcon = "assets/icons/google.svg";
        _title = "구글로 로그인";
        _backgroundColor = CustomColor.google;
        _fontColor = CustomColor.black;
        break;
      case SocialEnum.kakao:
        _socialIcon = "assets/icons/kakao.svg";
        _title = "카카오로 로그인";
        _backgroundColor = CustomColor.kakao;
        _fontColor = CustomColor.black;
        break;
      case SocialEnum.facebook:
        _socialIcon = "assets/icons/facebook.svg";
        _title = "페이스북으로 로그인";
        _backgroundColor = CustomColor.facebook;
        _fontColor = CustomColor.white;
        break;
      case SocialEnum.naver:
        _socialIcon = "assets/icons/naver.svg";
        _title = "네이버로 로그인";
        _backgroundColor = CustomColor.naver;
        _fontColor = CustomColor.white;
        break;
      default:
        _socialIcon = "assets/icons/question-mark.svg";
        _title = "";
        _backgroundColor = Colors.black;
        _fontColor = CustomColor.white;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.infinity, 50),
            shadowColor: Colors.transparent,
            backgroundColor: _backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Standard.defaultBorderRadius))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: SvgPicture.asset(
                _socialIcon,
                width: 20,
              ),
            ),
            Text(
              _title,
              style: TextStyle(color: _fontColor),
            )
          ],
        ));
  }
}
