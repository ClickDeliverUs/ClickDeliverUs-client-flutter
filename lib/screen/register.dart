import 'package:cd_client/model/extrenal/request/register_req.dart';
import 'package:cd_client/apis/auth_api.dart';
import 'package:cd_client/screen/login.dart';
import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/util/helper/enum.dart';
import 'package:cd_client/util/helper/tel_format.dart';
import 'package:cd_client/util/logget.dart';
import 'package:cd_client/widget/atoms/button/btn_gender_toggle.dart';
import 'package:cd_client/widget/atoms/button/btn_register_checker.dart';
import 'package:cd_client/widget/atoms/button/primary_btn.dart';
import 'package:cd_client/widget/atoms/input/input_auth.dart';
import 'package:cd_client/widget/atoms/input/props/input_data.dart';
import 'package:cd_client/widget/atoms/input/props/input_default.dart';
import 'package:cd_client/widget/atoms/input/props/input_validate_options.dart';
import 'package:cd_client/widget/atoms/picker/picker_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../util/constant/standard.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 0: id, 1: password, 2: passwordVerify, 3: name, 4: nickName, 5: address, 6: tel
  final List<TextEditingController> _textEditingControllers = List.generate(
    7,
    (_) => TextEditingController(),
  );
  final List<bool> _gender = [true, false];
  DateTime? _birth;
  bool? _isIdAvailable;
  bool? _isPasswordMatches;
  bool? _isTelValid;

  void _idInputChanged() {
    if (_isIdAvailable == true) {
      setState(() {
        _isIdAvailable = null;
      });
    }
  }

  void _passwordInputChanged() {
    if (_textEditingControllers[1].text.isEmpty &&
        _textEditingControllers[2].text.isEmpty) {
      _isPasswordMatches = null;
      return;
    }

    setState(() {
      _isPasswordMatches =
          _textEditingControllers[1].text == _textEditingControllers[2].text
              ? true
              : false;
    });
  }

  void _idTelInputChanged() {
    if (_textEditingControllers[6].text.isEmpty) {
      _isTelValid = null;
      return;
    }

    setState(() {
      _isTelValid = _textEditingControllers[6].text.length != 13 ? false : null;
    });
  }

  String? _idErrorText() {
    return _isIdAvailable == true
        ? "사용 가능한 아이디입니다"
        : _isIdAvailable == false
            ? "중복된 아이디입니다"
            : null;
  }

  String? _passwordErrorText() {
    return _isPasswordMatches == true
        ? "비밀번호가 일치합니다."
        : _isPasswordMatches == false
            ? "비밀번호가 일치하지 않습니다."
            : null;
  }

  String? _telErrorText() {
    return _isTelValid == false ? "유효하지 않은 전화번호입니다." : null;
  }

  Future<void> _setBirth(BuildContext context) async {
    DateTime? picked = await CommonHelper.datePicker(context, 1920, 2024);

    if (picked != null) {
      setState(() {
        _birth = picked;
      });
    }
  }

  void _setGender(int index) {
    setState(() {
      for (int i = 0; i < _gender.length; i++) {
        _gender[i] = (i == index);
      }
    });
  }

  void _setIsIdAvailable(bool isAvailable) {
    setState(() {
      _isIdAvailable = isAvailable;
    });
  }

  bool _checkAdult(DateTime birthDate) {
    final currentDate = DateTime.now();
    final age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month) {
      return age < 19;
    } else if (currentDate.month == birthDate.month) {
      if (currentDate.day < birthDate.day) {
        return age < 19;
      }
    }

    return age >= 19;
  }

  void _submitForm() {
    bool hasEmptyField = false;

    for (int i = 0; i < _textEditingControllers.length; i++) {
      if (_textEditingControllers[i].text.isEmpty) {
        hasEmptyField = true;
        break;
      }
    }

    if (hasEmptyField || _birth == null) {
      CommonHelper.showSnackBar(context, "빈칸을 모두 입력해 주세요");
      return;
    }

    if (_isIdAvailable != true) {
      CommonHelper.showSnackBar(context, "아이디 중복체크를 해주세요");
      return;
    }

    if (_isPasswordMatches != true) {
      CommonHelper.showSnackBar(context, "비밀번호가 일치하지 않습니다");
      return;
    }

    if (_textEditingControllers[6].text.length != 13) {
      CommonHelper.showSnackBar(context, "전화번호가 올바르지 않습니다");
      return;
    }

    RegisterReq registerReq = RegisterReq(
        id: _textEditingControllers[0].text,
        password: _textEditingControllers[1].text,
        name: _textEditingControllers[3].text,
        nickName: _textEditingControllers[4].text,
        address: _textEditingControllers[5].text,
        tel: _textEditingControllers[6].text,
        birth: _birth.toString(),
        gender: _gender[0],
        isAdult: _checkAdult(_birth!));

    context.read<AuthApi>().fetchRegister(registerReq).then((value) {
      // TODO: alert modal appear
      if (value) CommonHelper.pushRemoveScreen(context, const Login());
    });
  }

  Widget containerTitle(String title) {
    return SizedBox(
      height: 60,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _textEditingControllers[0].addListener(_idInputChanged);
    _textEditingControllers[1].addListener(_passwordInputChanged);
    _textEditingControllers[2].addListener(_passwordInputChanged);
    _textEditingControllers[6].addListener(_idTelInputChanged);
  }

  @override
  void dispose() {
    _textEditingControllers[0].removeListener(_idInputChanged);
    _textEditingControllers[1].removeListener(_passwordInputChanged);
    _textEditingControllers[2].removeListener(_passwordInputChanged);
    _textEditingControllers[6].removeListener(_idTelInputChanged);

    for (var controller in _textEditingControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i("build register page");

    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
        centerTitle: true,
        foregroundColor: Colors.black,
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
              child: Column(
                children: [
                  Column(
                    children: [
                      containerTitle("계정 정보를 입력해 주세요"),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 240,
                                child: InputAuth(
                                  inputDefault: InputDefault(
                                    labelText: "아이디  [영문, 숫자]",
                                    icon: Icons.email,
                                  ),
                                  inputData: InputData(
                                      textEditingController:
                                          _textEditingControllers[0],
                                      maxLength: 14),
                                  inputValidateOptions: InputValidateOptions(
                                      condition: _isIdAvailable,
                                      text: _idErrorText()),
                                  textInputFormatter: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z0-9]')),
                                  ],
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: _textEditingControllers[0],
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return BtnRegisterChecker(
                                    value: _textEditingControllers[0].text,
                                    setIsIdAvailable: _setIsIdAvailable,
                                  );
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                InputAuth(
                                  inputDefault: InputDefault(
                                    labelText: "비밀번호",
                                    icon: Icons.lock,
                                  ),
                                  inputData: InputData(
                                      textEditingController:
                                          _textEditingControllers[1],
                                      obscureText: true),
                                  inputValidateOptions: InputValidateOptions(
                                    condition: _isPasswordMatches,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputAuth(
                                  inputDefault: InputDefault(
                                    labelText: "비밀번호 확인",
                                    icon: Icons.check,
                                  ),
                                  inputData: InputData(
                                      textEditingController:
                                          _textEditingControllers[2],
                                      obscureText: true),
                                  inputValidateOptions: InputValidateOptions(
                                    condition: _isPasswordMatches,
                                    text: _passwordErrorText(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      containerTitle("회원님을 소개해 주세요"),
                      SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InputAuth(
                              inputDefault: InputDefault(
                                labelText: "이름",
                                icon: Icons.person,
                              ),
                              inputData: InputData(
                                  textEditingController:
                                      _textEditingControllers[3],
                                  maxLength: 10),
                            ),
                            InputAuth(
                              inputDefault: InputDefault(
                                labelText: "닉네임",
                                icon: Icons.face,
                              ),
                              inputData: InputData(
                                  textEditingController:
                                      _textEditingControllers[4],
                                  maxLength: 10),
                            ),
                            InputAuth(
                              inputDefault: InputDefault(
                                labelText: "주소",
                                icon: Icons.location_on,
                              ),
                              inputData: InputData(
                                  textEditingController:
                                      _textEditingControllers[5],
                                  maxLength: 50),
                            ),
                            InputAuth(
                              inputDefault: InputDefault(
                                labelText: "휴대폰  ['-' 없이 입력하세요.]",
                                icon: Icons.phone,
                              ),
                              inputData: InputData(
                                textEditingController:
                                    _textEditingControllers[6],
                                maxLength: 13,
                              ),
                              keyboardType: TextInputType.number,
                              inputValidateOptions: InputValidateOptions(
                                condition: _isTelValid,
                                text: _telErrorText(),
                              ),
                              textInputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                Telformat(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 240,
                                  child: PickerAuth(
                                    icon: Icons.cake,
                                    onTap: _setBirth,
                                    value: CommonHelper.dateFormatFull(_birth),
                                  ),
                                ),
                                BtnGenderToggle(
                                  gender: _gender,
                                  onPressed: _setGender,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: PrimaryBtn(
                      label: "가입하기",
                      onPressed: _submitForm,
                      widgetColor: WidgetColor.skyblue,
                      widgetSize: WidgetSize.big,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
