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
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.15,
          horizontal: MediaQuery.of(context).size.width * 0.3,
        ),
        alignment: Alignment.center,
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

  Widget _logo() => Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            color: Colors.grey,
            width: 200,
            height: 200,
            child: const Center(
              child: Text(
                "Logo",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
      );

  Widget _body() => Expanded(
        flex: 4,
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
