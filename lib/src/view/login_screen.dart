import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/constants/image_path.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: (ResponsibleLayout.isMobile(context))
            ? AppBar(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xff713eff),
                leading: GestureDetector(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
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
                    width: (ResponsibleLayout.isMobile(context))
                        ? MediaQuery.of(context).size.width
                        : 400,
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _logo(),
                            _textFields(),
                            _button(),
                            _options(),
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
      ),
    );
  }

  /// 앱 로고
  Widget _logo() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 150,
          height: 150,
          alignment: Alignment.center,
          child: Image.asset(
            ImagePath.appiconpng,
            fit: BoxFit.contain,
          ),
        ),
      );

  /// 로그인 정보 입력 필드
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

  /// 로그인 버튼
  Widget _button() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SignButton(
            onPressed: () {
              controller.signIn();
            },
            width: double.infinity,
            height: 40,
            child: const Text(
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
        InkWell(
            onTap: controller.moveToResister,
            child: Text(
              '회원가입',
              style: Get.theme.textTheme.bodySmall,
            )),
      ],
    );
  }
}
