import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/account_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/terms_check_box.dart';

class MobileLogin extends GetView<LoginController> {
  const MobileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _logo(),
        _body(),
      ],
    ));
  }

  Widget _logo() => const SizedBox(
      height: 80,
      child: Text(
        "Logo",
        style: TextStyle(fontSize: 40),
      ));

  Widget _body() => SizedBox(
        height: Get.size.height * 0.4,
        child: Obx(
          () => IndexedStack(index: controller.index, children: [
            LoginBox(
              email: controller.emailController,
              password: controller.passwordController,
            ),
            const TermsCheckBox(),
            const AccountBox()
          ]),
        ),
      );
}
