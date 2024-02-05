import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';

class FindPasswordController extends GetxController {
  final TextEditingController email = TextEditingController();
  static FindPasswordController get to => Get.find();

  /// 비밀번호 초기화
  void resetPassword() async {
    final data = email.value.text.toString();
    final result = await MemberController.to.resetPassword(data);

    /// 사용자에게 결과를 토스트로 보여줌
    showToast(result);
    Get.back();
  }

  void showToast(String message) => Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: const Color(0xff8D63FF),
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        fontSize: 16.0,
        gravity: ToastGravity.TOP,
      );
}
