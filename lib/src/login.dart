import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return const DesktopLogin();
      } else {
        return const DesktopLogin();
      }
    });
  }
}
