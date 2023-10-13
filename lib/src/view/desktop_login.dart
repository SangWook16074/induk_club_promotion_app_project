import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/complete_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/account_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/terms_check_box.dart';

class DesktopLogin extends StatefulWidget {
  const DesktopLogin({super.key});

  @override
  State<DesktopLogin> createState() => _DesktopLoginState();
}

class _DesktopLoginState extends State<DesktopLogin> {
  final TextEditingController id = TextEditingController();
  final TextEditingController password = TextEditingController();
  late int pageIndex = 0;

  @override
  void dispose() {
    super.dispose();
    id.dispose();
    password.dispose();
  }

  void moveToSecond() {
    setState(() {
      id.clear();
      password.clear();
      pageIndex++;
    });
  }

  void moveToNext() => setState(() {
        pageIndex++;
      });

  void resetIndex() => setState(() {
        pageIndex = 0;
      });

  @override
  Widget build(BuildContext context) {
    List<Widget> boxes = [
      LoginBox(
        lenght: 400,
        id: id,
        password: password,
        moveToFindAccount: () {},
        moveToFindPassword: () {},
        moveToSignUp: moveToSecond,
      ),
      TermsCheckBox(
        lenght: 400,
        moveToNext: moveToNext,
      ),
      AccountBox(
        lenght: 400,
        id: id,
        password: password,
        moveToNext: moveToNext,
      ),
      CompleteBox(
        lenght: 400,
        moveToLogin: resetIndex,
      )
    ];

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imagebox(),
          Container(
              width: 800,
              padding: const EdgeInsets.all(30.0),
              color: const Color(0xff4e4e4e),
              alignment: Alignment.center,
              child: boxes[pageIndex])
        ],
      ),
    );
  }

  Widget _imagebox() {
    return Container(
      width: MediaQuery.of(context).size.width - 800,
      color: const Color(0xff2e2e2e),
    );
  }
}
