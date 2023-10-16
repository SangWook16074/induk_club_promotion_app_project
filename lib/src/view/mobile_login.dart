import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/account_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/complete_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/terms_check_box.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
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
      backgroundColor: const Color(0xff191123),
      body: Container(
          padding: const EdgeInsets.all(30.0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/login_decoration.png',
                  ))),
          child: boxes[pageIndex]),
    );
  }
}
