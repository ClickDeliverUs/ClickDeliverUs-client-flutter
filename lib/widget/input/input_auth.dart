import 'package:cd_client/model/internal/widget_props/register_input_props.dart';
import 'package:flutter/material.dart';

import '../../util/constant/custom_color.dart';
import '../../util/constant/standard.dart';

class InputAuth extends StatefulWidget {
  final RegisterInputProps registerInputProps;

  const InputAuth({super.key, required this.registerInputProps});

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

  String? _validator(String? value) {
    String title = widget.registerInputProps.labelText;

    if (value == null || value.isEmpty) {
      return '$title을(를) 입력해 주세요';
    }

    return null;
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
    bool? borderCondition = widget.registerInputProps.borderCondition;
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Standard.defaultBorderRadius),
      borderSide: BorderSide(
          color: borderCondition == true
              ? CustomColor.indigo
              : borderCondition == false
                  ? Colors.red
                  : CustomColor.whiteGrey,
          width: 2),
    );

    return TextFormField(
      focusNode: _focusNode,
      controller: widget.registerInputProps.textEditingController,
      inputFormatters: widget.registerInputProps.textInputFormatter,
      obscureText: widget.registerInputProps.isPassword == true ? true : false,
      maxLength: widget.registerInputProps.maxLength,
      style: const TextStyle(fontSize: 12, fontFamily: "KBO"),
      decoration: InputDecoration(
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: widget.registerInputProps.labelText,
          prefixIcon: Icon(
            widget.registerInputProps.icon,
            size: iconSize,
          ),
          suffixIcon: _isTap == true
              ? GestureDetector(
                  onTap: () =>
                      widget.registerInputProps.textEditingController.clear(),
                  child: Icon(
                    Icons.cancel,
                    size: iconSize,
                  ),
                )
              : null),
      validator: _validator,
    );
  }
}
