import 'package:cd_client/util/helper/common.dart';
import 'package:cd_client/widget/button/btn_register_checker.dart';
import 'package:cd_client/widget/input/input_login.dart';
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
  String _id = "";
  String _password = "";
  String _passwordVerify = "";
  String _name = "";
  String _nickName = "";
  DateTime? _birth;
  String _address = "";
  String _tel = "";
  bool? _isIdAvailable;
  bool? _isPasswordMatches;

  void setId(String value) {
    setState(() {
      _id = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      _password = value;
    });

    if (_password == _passwordVerify) {
      setState(() {
        _isPasswordMatches = true;
      });
    } else {
      setState(() {
        _isPasswordMatches = false;
      });
    }
  }

  void setPasswordVerify(String value) {
    setState(() {
      _passwordVerify = value;
    });

    if (_password == _passwordVerify) {
      setState(() {
        _isPasswordMatches = true;
      });
    } else {
      setState(() {
        _isPasswordMatches = false;
      });
    }
  }

  void setName(String value) {
    setState(() {
      _name = value;
    });
  }

  void setNickName(String value) {
    setState(() {
      _nickName = value;
    });
  }

  void setAddress(String value) {
    setState(() {
      _address = value;
    });
  }

  void setTel(String value) {
    setState(() {
      _tel = value;
    });
  }

  void idValidation() {
    setState(() {
      _isIdAvailable = _id != "asdf" ? true : false;
    });
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

  @override
  Widget build(BuildContext context) {
    loggerNoStack.i("build register page");
    print(_password);
    print(_passwordVerify);
    print(_isPasswordMatches);

    return Scaffold(
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
            child: Column(children: [
              SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InputLogin(
                                name: "아이디",
                                width: 240,
                                icon: Icons.account_circle,
                                onChanged: setId,
                              ),
                              BtnRegisterChecker(
                                  name: "중복확인",
                                  value: _id,
                                  onPressed: idValidation)
                            ]),
                      ),
                      (_isIdAvailable == true)
                          ? const Text(
                              "사용 가능한 아이디입니다.",
                              style: TextStyle(color: CustomColor.indigo),
                            )
                          : (_isIdAvailable == false)
                              ? const Text(
                                  "중복된 아이디입니다.",
                                  style: TextStyle(color: Colors.red),
                                )
                              : const SizedBox()
                    ],
                  )),
              SizedBox(
                height: 180,
                child: Column(children: [
                  SizedBox(
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InputLogin(
                          name: "비밀번호",
                          icon: Icons.lock,
                          isPassword: true,
                          onChanged: setPassword,
                        ),
                        InputLogin(
                          name: "비밀번호 확인",
                          icon: Icons.check,
                          isPassword: true,
                          onChanged: setPasswordVerify,
                        ),
                      ],
                    ),
                  ),
                  (_isPasswordMatches == false)
                      ? const Text(
                          "비밀번호가 일치하지 않습니다.",
                          style: TextStyle(color: Colors.red),
                        )
                      : const SizedBox()
                ]),
              ),
              (_isPasswordMatches == true
                  ? Column(
                      children: [
                        SizedBox(
                          height: 450,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InputLogin(
                                  name: "이름",
                                  icon: Icons.person,
                                  onChanged: setName,
                                ),
                                InputLogin(
                                  name: "닉네임",
                                  icon: Icons.face,
                                  onChanged: setNickName,
                                ),
                                PickerAuth(
                                    icon: Icons.cake,
                                    onTap: setBirth,
                                    value: CommonHelper.dateFormatFull(_birth)),
                                InputLogin(
                                  name: "주소",
                                  icon: Icons.location_on,
                                  onChanged: setAddress,
                                ),
                                InputLogin(
                                  name: "젼화번호",
                                  icon: Icons.phone,
                                  onChanged: setTel,
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
                          child: BtnSubmit(
                              name: "가입하기",
                              backgroundColor: CustomColor.indigo,
                              foregroundColor: CustomColor.white,
                              onPressed: () {}),
                        )
                      ],
                    )
                  : const SizedBox())
            ]),
          ),
        ),
      ),
    );
  }
}
