import 'package:cd_client/widget/atoms/input/props/input_data.dart';
import 'package:cd_client/widget/atoms/input/props/input_default.dart';
import 'package:cd_client/widget/atoms/input/props/input_validate_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../util/constant/custom_color.dart';
import '../../../util/constant/standard.dart';

class InputAuth extends StatefulWidget {
  final InputDefault inputDefault;
  final InputData inputData;
  final InputValidateOptions? inputValidateOptions;
  final List<TextInputFormatter>? textInputFormatter;

  const InputAuth(
      {super.key,
      required this.inputDefault,
      required this.inputData,
      this.inputValidateOptions,
      this.textInputFormatter});

  @override
  State<InputAuth> createState() => _InputAuthState();
}

class _InputAuthState extends State<InputAuth> {
  bool _isTap = false;
  final FocusNode _focusNode = FocusNode();

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() => _isTap = true);
    } else {
      setState(() => _isTap = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
      borderSide: BorderSide(
          color: widget.inputValidateOptions?.condition == true
              ? CustomColor.indigo
              : widget.inputValidateOptions?.condition == false
                  ? Colors.red
                  : CustomColor.whiteGrey,
          width: 1),
    );

    return TextFormField(
      focusNode: _focusNode,
      controller: widget.inputData.textEditingController,
      inputFormatters: widget.textInputFormatter,
      obscureText: widget.inputData.obscureText == true ? true : false,
      maxLength: widget.inputData.maxLength,
      style: const TextStyle(fontSize: 12, fontFamily: "KBO"),
      decoration: InputDecoration(
          // floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          hintText: widget.inputDefault.labelText,
          errorText: widget.inputValidateOptions?.text,
          errorStyle: TextStyle(
              color: widget.inputValidateOptions?.condition == true
                  ? CustomColor.indigo
                  : Colors.red),
          prefixIcon: Icon(
            widget.inputDefault.icon,
            size: iconSize,
          ),
          suffixIcon: _isTap == true
              ? GestureDetector(
                  onTap: () => widget.inputData.textEditingController.clear(),
                  child: Icon(
                    Icons.cancel,
                    size: iconSize,
                  ),
                )
              : null),
    );
  }
}
