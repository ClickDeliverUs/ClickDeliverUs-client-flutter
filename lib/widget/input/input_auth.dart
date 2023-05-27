import 'package:cd_client/model/internal/register_form_model.dart';
import 'package:flutter/material.dart';

class InputAuth extends StatefulWidget {
  final RegisterFormModel registerFormModel;

  const InputAuth({super.key, required this.registerFormModel});

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
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.registerFormModel.textEditingController,
      obscureText: widget.registerFormModel.isPassword == true ? true : false,
      maxLength: widget.registerFormModel.maxLength,
      decoration: InputDecoration(
          labelText: widget.registerFormModel.labelText,
          prefixIcon: Icon(widget.registerFormModel.icon),
          suffixIcon: _isTap == true
              ? GestureDetector(
                  onTap: () =>
                      widget.registerFormModel.textEditingController.clear(),
                  child: const Icon(Icons.cancel),
                )
              : null),
      validator: widget.registerFormModel.validator,
    );
  }
}
