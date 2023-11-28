import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/account_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/terms_check_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/verification_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            decoration: (ResponsibleLayout.isMobile(context))
                ? null
                : BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.grey)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _logo(),
                  _body(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 200,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black)),
          child: const Text("Logo"),
        ),
      );

  Widget _body() => Padding(
        padding: (ResponsibleLayout.isMobile(context))
            ? const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0)
            : const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
        child: GetX<LoginController>(builder: (controller) {
          return IndexedStack(
            index: controller.pageIndex,
            children: const [
              LoginBox(),
              TermsCheckBox(),
              AccountBox(),
              VerificaionBox()
            ],
          );
        }),
      );
}
