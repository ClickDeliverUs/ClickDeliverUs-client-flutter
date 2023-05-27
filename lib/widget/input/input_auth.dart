import 'package:cd_client/model/internal/widget_props/register_input_props.dart';
import 'package:flutter/material.dart';

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

  String? validator(String? value) {
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
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.registerInputProps.textEditingController,
      obscureText: widget.registerInputProps.isPassword == true ? true : false,
      maxLength: widget.registerInputProps.maxLength,
      decoration: InputDecoration(
          labelText: widget.registerInputProps.labelText,
          prefixIcon: Icon(widget.registerInputProps.icon),
          suffixIcon: _isTap == true
              ? GestureDetector(
                  onTap: () =>
                      widget.registerInputProps.textEditingController.clear(),
                  child: const Icon(Icons.cancel),
                )
              : null),
      validator: validator,
    );
  }
}
