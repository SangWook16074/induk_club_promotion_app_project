import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/apple_login_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/google_login_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/social_image_icon.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class LoginBox extends GetView<LoginController> {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _textFields(),
        _button(),
        _options(),
        _divider(),
        _socialSignUpBtn(),
      ],
    );
  }

  Widget _textFields() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '이메일',
                style: Get.theme.textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: LoginTextField(controller: controller.emailController),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '비밀번호',
                style: Get.theme.textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: LoginTextField(
                controller: controller.passwordController,
                obscureText: true,
              ),
            )
          ],
        ),
      );

  Widget _button() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: SignButton(
            width: double.infinity,
            child: Text(
              '로그인',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      );

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: controller.moveToFindAccount,
            child: Text(
              '아이디 찾기',
              style: Get.theme.textTheme.bodySmall,
            )),
        GestureDetector(
            onTap: controller.moveToFindPassword,
            child: Text(
              '비밀번호 찾기',
              style: Get.theme.textTheme.bodySmall,
            )),
        GestureDetector(
            onTap: controller.moveToTerm,
            child: Text(
              '회원가입',
              style: Get.theme.textTheme.bodySmall,
            )),
      ],
    );
  }

  Widget _socialSignUpBtn() => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GoogleLoginButton(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: AppleLoginButton(),
          ),
        ],
      );

  Widget _divider() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 1.0,
              decoration: const BoxDecoration(color: Colors.black),
            ),
            const Text(
              "Start with",
              style: TextStyle(fontSize: 10),
            ),
            Container(
              width: 100,
              height: 1.0,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ],
        ),
      );
}
