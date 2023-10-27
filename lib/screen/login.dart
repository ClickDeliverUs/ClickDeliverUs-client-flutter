import 'package:cd_client/bloc/user_acoount_bloc.dart';
import 'package:cd_client/screen/home.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/util/logget.dart';
import 'package:cd_client/widget/molecules/auth_option_row.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:cd_client/widget/atoms/input/input_auth.dart';
import 'package:cd_client/widget/atoms/input/props/input_data.dart';
import 'package:cd_client/widget/atoms/input/props/input_default.dart';
import 'package:flutter/material.dart';
import 'package:cd_client/util/constant/standard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String id = _idController.text;
      String password = _passwordController.text;

      context
          .read<UserAccountBloc>()
          .add(LoginEvent(id: id, password: password));

      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      if (context.read<UserAccountBloc>().state.isLoggedIn == true) {
        CommonHelper.pushRemoveScreen(context, const Home());
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<UserAccountBloc>().state.isLoggedIn == true) {
        CommonHelper.pushRemoveScreen(context, const Home());
      }
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i("build login page");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("로그인"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Standard.defaultPadding),
        child: SizedBox(
          height: 400,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputAuth(
                  inputDefault: InputDefault(
                    labelText: "아이디",
                    icon: Icons.email,
                  ),
                  inputData: InputData(textEditingController: _idController),
                ),
                InputAuth(
                  inputDefault: InputDefault(
                    labelText: "비밀번호",
                    icon: Icons.lock,
                  ),
                  inputData: InputData(
                      textEditingController: _passwordController,
                      obscureText: true),
                ),
                PrimaryBtn(
                  label: "로그인",
                  onPressed: _submitForm,
                  widgetColor: WidgetColor.skyblue,
                  widgetSize: WidgetSize.big,
                  width: double.infinity,
                ),
                AuthOptionRow(
                  height: 40,
                  textL: "아이디 찾기",
                  textR: "비밀번호 찾기",
                  onPressedL: () {
                    CommonHelper.pushRemoveScreen(context, const Home());
                  },
                  onPressedR: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
