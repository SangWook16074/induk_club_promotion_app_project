import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class LoginBox extends GetView<LoginController> {
  final TextEditingController? email;
  final TextEditingController? password;
  const LoginBox({super.key, required this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _textFields(),
        _button(),
        _options(),
      ],
    );
  }

  Widget _textFields() => Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                '이메일',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: LoginTextField(controller: email!),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                '비밀번호',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: LoginTextField(
                controller: password!,
                obscureText: true,
              ),
            )
          ],
        ),
      );

  Widget _button() => Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: Get.size.width * 0.1),
        child: const SignButton(
            width: double.infinity,
            child: Text(
              '로그인',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      );

  Widget _options() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.size.width * 0.1, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: controller.moveToFindAccount,
              child: const Text(
                '아이디 찾기',
                style: TextStyle(color: Colors.black),
              )),
          GestureDetector(
              onTap: controller.moveToFindPassword,
              child: const Text(
                '비밀번호 찾기',
                style: TextStyle(color: Colors.black),
              )),
          GestureDetector(
              onTap: controller.moveToSignUp,
              child: const Text(
                '회원가입',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
