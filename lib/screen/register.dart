import 'package:cd_client/model/internal/register_form_model.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_auth.dart';
import 'package:cd_client/widget/picker/picker_auth.dart';
import 'package:flutter/material.dart';
import '../util/constant/custom_color.dart';
import '../util/constant/standard.dart';
import '../main.dart';
import '../widget/button/btn_submit.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordVerifyController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  DateTime? _birth;
  bool isIdAvailable = false;
  late bool isPasswordMatches;

  String? idValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '아이디를 입력해 주세요';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해 주세요';
    }

    if (value == _passwordVerifyController.text) {
      setState(() => isPasswordMatches = true);
    } else {
      setState(() => isPasswordMatches = false);
      return "비밀번호가 일치하지 않습니다";
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '이름을 입력해 주세요';
    }
    return null;
  }

  String? nickNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '닉네임을 입력해 주세요';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '주소를 입력해 주세요';
    }
    return null;
  }

  String? telValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '전화번호를 입력해 주세요';
    }
    return null;
  }

  // TODO: implement submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String id = _idController.text;
      String password = _passwordController.text;
      String passwordVerify = _passwordVerifyController.text;
      print('ID: $id');
      print('Password: $password');
      print('PasswordVerify: $passwordVerify');
    }
  }

  Future<void> setBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime(2024),
    );

    if (picked != null) {
      setState(() {
        _birth = picked;
      });
    }
  }

  void idValidation(BuildContext context) {
    // TODO: implement duplicate email checking request
    String existPassword = "asdf";

    if (_idController.text == existPassword) {
      CommonHelper.showSnackBar(context, "중복된 아이디입니다");
      setState(() {
        isIdAvailable = false;
      });
    } else {
      CommonHelper.showSnackBar(context, "사용 가능한 아이디입니다");
      setState(() {
        isIdAvailable = true;
      });
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _passwordVerifyController.dispose();
    _nameController.dispose();
    _nickNameController.dispose();
    _addressController.dispose();
    _telController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i("build register page");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("회원가입"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Standard.defaultPadding),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(children: [
                const SizedBox(
                  height: 40,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "계정 정보를 입력해 주세요",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 240,
                            child: InputAuth(
                                registerFormModel: RegisterFormModel(
                              textEditingController: _idController,
                              labelText: "아이디",
                              icon: Icons.email,
                              validator: idValidator,
                              maxLength: 14,
                            )),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _idController,
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return BtnRegisterChecker(
                                  name: "중복확인",
                                  value: _idController.text,
                                  onPressed: idValidation);
                            },
                          )
                        ],
                      ),
                      InputAuth(
                          registerFormModel: RegisterFormModel(
                        textEditingController: _passwordController,
                        labelText: "비밀번호",
                        icon: Icons.lock,
                        validator: passwordValidator,
                        isPassword: true,
                      )),
                      InputAuth(
                          registerFormModel: RegisterFormModel(
                        textEditingController: _passwordVerifyController,
                        labelText: "비밀번호 확인",
                        icon: Icons.check,
                        isPassword: true,
                      )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "회원님을 소개해 주세요",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(
                      height: 450,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputAuth(
                                registerFormModel: RegisterFormModel(
                                    textEditingController: _nameController,
                                    labelText: "이름",
                                    icon: Icons.person,
                                    validator: nameValidator,
                                    maxLength: 10)),
                            InputAuth(
                                registerFormModel: RegisterFormModel(
                                    textEditingController: _nickNameController,
                                    labelText: "닉네임",
                                    icon: Icons.face,
                                    validator: nickNameValidator,
                                    maxLength: 10)),
                            PickerAuth(
                                icon: Icons.cake,
                                onTap: setBirth,
                                value: CommonHelper.dateFormatFull(_birth)),
                            InputAuth(
                                registerFormModel: RegisterFormModel(
                                    textEditingController: _addressController,
                                    labelText: "주소",
                                    icon: Icons.location_on,
                                    validator: addressValidator,
                                    maxLength: 50)),
                            InputAuth(
                                registerFormModel: RegisterFormModel(
                                    textEditingController: _telController,
                                    labelText: "전화번호",
                                    icon: Icons.phone,
                                    validator: telValidator,
                                    maxLength: 13)),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
                      child: BtnSubmit(
                          name: "가입하기",
                          backgroundColor: CustomColor.indigo,
                          foregroundColor: CustomColor.white,
                          onPressed: _submitForm),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
