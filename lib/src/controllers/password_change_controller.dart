import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';

class PasswordChangeController extends GetxController {
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordAgain = TextEditingController();
  final MemberRepository repository;
  PasswordChangeController({required this.repository});

  static PasswordChangeController get to => Get.find();

  /// 사용자가 비밀번호를 변경하는 로직
  /// 원하는 비밀번호를 입력한 후
  /// 버튼을 누르면 비밀번호가 변경됨
  // void changePassword() async {
  //   // 빈칸은 존재할 수 없음
  //   if (password.value.text == "") {
  //     showToast('새로운 비밀번호를 입력하세요');
  //     return;
  //   }

  //   if (passwordAgain.value.text == "") {
  //     showToast('비밀번호를 한 번 더 입력하세요');
  //     return;
  //   }

  //   final data = {
  //     "email": MemberController.to.member?.id,
  //     "password": password.value.text.toString()
  //   };
  //   final response = await repository.changePassword(data);
  //   if (response == "비밀번호가 변경되었습니다 !") {
  //     showToast(response);
  //     Get.back();
  //   } else {
  //     showToast(response);
  //   }
  // }

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
