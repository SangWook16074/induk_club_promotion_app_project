import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/find_password_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class FindPassword extends StatelessWidget {
  const FindPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          appBar: (ResponsibleLayout.isMobile(context))
              ? AppBar(
                  leading: GestureDetector(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff713eff),
                    ),
                  ),
                  title: Text(
                    "비밀번호 찾기",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  titleTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                )
              : null,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _header(),
                  _email(),
                  _button(),
                ],
              ),
            ),
          )),
    );
  }

  Widget _header() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 60.0),
        child: Text(
          "가입에 사용한 이메일이 필요합니다!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
      );

  Widget _email() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoginTextField(
          hintText: "example@example.com",
          controller: FindPasswordController.to.email,
          type: TextInputType.emailAddress,
        ),
      );

  Widget _button() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SignButton(
            width: double.infinity,
            height: 55,
            onPressed: FindPasswordController.to.resetPassword,
            child: const Text(
              "비밀번호 찾기",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
      );
}
