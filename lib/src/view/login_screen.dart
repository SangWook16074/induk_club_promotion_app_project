import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/account_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/apple_login_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/google_login_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/kakao_login_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/terms_check_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/verification_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (ResponsibleLayout.isMobile(context))
          ? AppBar(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xff713eff),
              leading: const Icon(
                Icons.arrow_back_ios_new,
              ),
              elevation: 0.0,
            )
          : null,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 350,
                  decoration: (ResponsibleLayout.isMobile(context))
                      ? null
                      : BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _logo(),
                          _textFields(),
                          _button(),
                          _options(),
                          _divider(),
                          _socialSignUpBtn(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 100,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black)),
          child: const Text("Logo"),
        ),
      );

  Widget _textFields() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
            height: 40,
            child: Text(
              '로그인',
              style: TextStyle(color: Colors.white, fontSize: 15),
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

  Widget _socialSignUpBtn() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(child: const GoogleLoginButton()),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppleLoginButton(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: controller.signIn, child: const KakaoLoginButton()),
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
