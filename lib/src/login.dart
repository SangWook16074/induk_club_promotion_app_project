import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_login.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_login.dart';

class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (Platform.isAndroid || Platform.isIOS || constraints.maxWidth < 800) {
        return const MobileLogin();
      } else {
        return const DesktopLogin();
      }
    });
  }
}
