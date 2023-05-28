import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter/material.dart';
import '../../util/constant/custom_color.dart';
import '../../util/helper/common.dart';

class BtnRegisterChecker extends StatefulWidget {
  final String value;
  final void Function() setIsIdAvailable;
  final void Function() setIsIdUnavailable;

  const BtnRegisterChecker(
      {super.key,
      required this.value,
      required this.setIsIdAvailable,
      required this.setIsIdUnavailable});

  @override
  State<BtnRegisterChecker> createState() => _BtnRegisterCheckerState();
}

class _BtnRegisterCheckerState extends State<BtnRegisterChecker> {
  void _idValidation(BuildContext context) {
    // TODO: implement duplicate email checking request
    String existPassword = "asdf";

    if (widget.value == existPassword) {
      CommonHelper.showSnackBar(context, "중복된 아이디입니다");
      widget.setIsIdUnavailable();
    } else {
      CommonHelper.showSnackBar(context, "사용 가능한 아이디입니다");
      widget.setIsIdAvailable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.value.isEmpty ? null : () => _idValidation(context),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
            ),
            backgroundColor:
                widget.value.isEmpty ? Colors.grey : CustomColor.indigo),
        child: const Text("중복확인"));
  }
}
