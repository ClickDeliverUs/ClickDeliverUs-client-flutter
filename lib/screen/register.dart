import 'package:cd_client/model/extrenal/request/register_req.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/tel_format.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_auth.dart';
import 'package:cd_client/widget/picker/picker_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/internal/widget_props/register_input_props.dart';
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
  final List<bool> _gender = [true, false];
  DateTime? _birth;
  bool? _isIdAvailable;
  late bool _isPasswordMatches;

  void _setIsIdAvailable() {
    setState(() {
      _isIdAvailable = true;
    });
  }

  void _setIsIdUnavailable() {
    setState(() {
      _isIdAvailable = false;
    });
  }

  Future<void> _setBirth(BuildContext context) async {
    DateTime? picked = await CommonHelper.datePicker(context, 1920, 2024);

    if (picked != null) {
      setState(() {
        _birth = picked;
      });
    }
  }

  bool _checkAdult(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(selectedDate);
    int age = (difference.inDays / 365).floor();
    return age >= 18;
  }

  void idInputChanged() {
    if (_isIdAvailable == true) {
      setState(() {
        _isIdAvailable = null;
      });
    }
  }

  void _passwordInputChanged() {
    setState(() {
      _isPasswordMatches =
          _passwordController.text == _passwordVerifyController.text
              ? true
              : false;
    });
  }

  // TODO: implement submit form, exception handling
  void _submitForm() {
    if (_isIdAvailable == null || _isIdAvailable == false) {
      CommonHelper.showSnackBar(context, "아이디 중복체크를 해주세요");
      return;
    }

    if (_isPasswordMatches == false) {
      CommonHelper.showSnackBar(context, "비밀번호가 일치하지 않습니다");
      return;
    }

    if (_formKey.currentState!.validate()) {
      String id = _idController.text;
      String password = _passwordController.text;
      String name = _nameController.text;
      String nickName = _nickNameController.text;
      String address = _addressController.text;
      String tel = _telController.text;
      DateTime birth = _birth!;
      bool gender = _gender[0];
      bool isAdult = _checkAdult(_birth!);

      RegisterReq registerReq = RegisterReq(
          id: id,
          password: password,
          name: name,
          nickName: nickName,
          address: address,
          tel: tel,
          birth: birth,
          gender: gender,
          isAdult: isAdult);
    } else {
      CommonHelper.showSnackBar(context, "입력란을 모두 채워주세요");
    }
  }

  @override
  void initState() {
    super.initState();
    _idController.addListener(idInputChanged);
    _passwordController.addListener(_passwordInputChanged);
    _passwordVerifyController.addListener(_passwordInputChanged);
  }

  @override
  void dispose() {
    _idController.removeListener(idInputChanged);
    _passwordController.removeListener(_passwordInputChanged);
    _passwordVerifyController.removeListener(_passwordInputChanged);

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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                SizedBox(
                  height: 320,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 240,
                            child: InputAuth(
                                registerInputProps: RegisterInputProps(
                                    textEditingController: _idController,
                                    labelText: "아이디",
                                    icon: Icons.email,
                                    maxLength: 14,
                                    borderCondition: _isIdAvailable)),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _idController,
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return BtnRegisterChecker(
                                  value: _idController.text,
                                  setIsIdAvailable: _setIsIdAvailable,
                                  setIsIdUnavailable: _setIsIdUnavailable);
                            },
                          )
                        ],
                      ),
                      InputAuth(
                          registerInputProps: RegisterInputProps(
                        textEditingController: _passwordController,
                        labelText: "비밀번호",
                        icon: Icons.lock,
                        isPassword: true,
                      )),
                      InputAuth(
                          registerInputProps: RegisterInputProps(
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
                                registerInputProps: RegisterInputProps(
                                    textEditingController: _nameController,
                                    labelText: "이름",
                                    icon: Icons.person,
                                    maxLength: 10)),
                            InputAuth(
                                registerInputProps: RegisterInputProps(
                                    textEditingController: _nickNameController,
                                    labelText: "닉네임",
                                    icon: Icons.face,
                                    maxLength: 10)),
                            InputAuth(
                                registerInputProps: RegisterInputProps(
                                    textEditingController: _addressController,
                                    labelText: "주소",
                                    icon: Icons.location_on,
                                    maxLength: 50)),
                            InputAuth(
                                registerInputProps: RegisterInputProps(
                                    textEditingController: _telController,
                                    labelText: "휴대폰   ['-' 없이 입력하세요.]",
                                    icon: Icons.phone,
                                    maxLength: 13,
                                    textInputFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  Telformat(),
                                  LengthLimitingTextInputFormatter(13)
                                ])),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 240,
                                  child: PickerAuth(
                                      icon: Icons.cake,
                                      onTap: _setBirth,
                                      value:
                                          CommonHelper.dateFormatFull(_birth)),
                                ),
                                ToggleButtons(
                                    isSelected: _gender,
                                    onPressed: (index) {
                                      setState(() {
                                        for (var i = 0;
                                            i < _gender.length;
                                            i++) {
                                          _gender[i] = (i == index);
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(
                                        Standard.defaultBorderRadius),
                                    selectedColor: CustomColor.indigo,
                                    color: Colors.grey,
                                    children: const [
                                      Text(
                                        "남",
                                        style:
                                            TextStyle(color: CustomColor.black),
                                      ),
                                      Text(
                                        "여",
                                        style:
                                            TextStyle(color: CustomColor.black),
                                      ),
                                    ])
                              ],
                            ),
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
