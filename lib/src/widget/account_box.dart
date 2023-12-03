import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';

import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class AccountBox extends GetView<LoginController> {
  const AccountBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _body(),
        _button(),
      ],
    );
  }

  Widget _body() {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  '이메일',
                  style: Get.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: LoginTextField(controller: controller.emailController)),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  '비밀번호',
                  style: Get.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: LoginTextField(
                controller: controller.passwordController,
                obscureText: true,
              )),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text('비밀번호 확인', style: Get.textTheme.bodySmall),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: LoginTextField(
                controller: controller.passwordControllerAgain,
                obscureText: true,
              )),
        ],
      ),
    );
  }

  Widget _button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SignButton(
            width: 150,
            height: 40,
            onPressed: controller.moveToNext,
            child: const Text(
              '다음',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ))
      ],
    );
  }
}
