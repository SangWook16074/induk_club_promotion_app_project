import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';

class ResisterController extends GetxController {
  final RxBool _isAgree = false.obs;
  final MemberRepository repository;
  ResisterController({required this.repository});

  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordAgain = TextEditingController();

  TextEditingController get email => _email;
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get passwordAgain => _passwordAgain;

  bool get isAgree => _isAgree.value;

  void agree(bool? value) {
    _isAgree(true);
  }

  void disagree(bool? value) {
    _isAgree(false);
  }

  // String signUp() {}

  void signUp() {
    if (_email.value.text == "") {
      showToast("이메일을 입력하세요 !");
      return;
    }

    if (_name.value.text == "") {
      showToast("사용자 이름을 입력하세요 !");
      return;
    }

    if (_password.value.text == "") {
      showToast("비밀번호를 입력하세요 !");
      return;
    }

    if (_passwordAgain.value.text == "") {
      showToast("비밀번호 확인을 입력하세요 !");
      return;
    }

    if (_password.value != _passwordAgain.value) {
      showToast("비밀번호 확인값이 다릅니다 !");
      return;
    }

    final data = {
      "email": _email.value.text.toString(),
      "name": _name.value.text.toString(),
      "password": _password.value.text.toString(),
    };

    repository.signUp(data).then((result) {
      if (result == "") {
        showToast("잠시 후 다시 시도해주세요.");
        return;
      }

      if (result == "이미 등록된 회원입니다.") {
        showToast(result);
        return;
      }

      if (result == "회원가입이 완료되었습니다.") {
        Get.back();
        return;
      }
    });

    // 비밀번호 조합 validation

    // 회원가입
  }

  void showToast(String message) => Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: const Color(0xff8D63FF),
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        fontSize: 16.0,
        gravity: ToastGravity.TOP,
        webPosition: "center",
        webBgColor: " #8D63FF",
      );
}
