import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/account_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/terms_check_box.dart';

class DesktopLogin extends GetView<LoginController> {
  const DesktopLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffE6E6E6), width: 2.0),
        ),
        width: Get.size.height * 0.75,
        height: Get.size.height * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            _body(),
          ],
        ),
      ),
    ));
  }

  Widget _logo() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Container(
          color: Colors.grey,
          height: 100,
          width: 200,
          child: const Center(
            child: Text(
              "Logo",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      );

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
