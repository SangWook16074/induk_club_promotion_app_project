import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/basic_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';

class AccountBox extends GetView<LoginController> {
  const AccountBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasicBox(body: _body(), button: _button());
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Text(
                '이메일',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: LoginTextField(controller: controller.emailController)),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Text(
                '비밀번호',
                style: TextStyle(fontSize: 20),
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
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Row(
            children: [
              Text(
                '비밀번호 확인',
                style: TextStyle(fontSize: 20),
              ),
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
    );
  }

  Widget _button() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff713eff),
          ),
          onPressed: controller.moveToNext,
          child: const Text('다음')),
    );
  }
}
