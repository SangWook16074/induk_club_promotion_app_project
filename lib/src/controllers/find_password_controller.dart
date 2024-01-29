import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';

class FindPasswordController extends GetxController {
  final TextEditingController email = TextEditingController();
  static FindPasswordController get to => Get.find();

  /// 비밀번호 초기화
  void resetPassword() async {
    final data = email.value.text.toString();
    final result = await MemberController.to.resetPassword(data);
    print(result);
    Get.back();
  }
}
