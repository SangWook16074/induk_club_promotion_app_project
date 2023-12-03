import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/kakao_login_api.dart';
import 'package:induk_club_promotion_app_project/src/view/home_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

enum Page { SIGNUP, TERM, RESISTER, VERIFICATION }

enum LoginPlatform { KAKAO, GOOGLE, APPLE, NONE }

class LoginController extends GetxController {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController passwordControllerAgain = TextEditingController();
  final Rxn<User> _user = Rxn<User>();
  final RxBool _isAgree = false.obs;
  final RxInt _index = 0.obs;
  LoginPlatform _loginPlatform = LoginPlatform.NONE;
  final KakaoLoginApi kakaoLoginApi;
  LoginController({
    required this.kakaoLoginApi,
  });
  User? get user => _user.value;
  int get pageIndex => _index.value;
  bool get isAgree => _isAgree.value;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void moveToNext() {
    if (_index.value == 3) {
      _index(0);
    } else {
      _index.value++;
    }
  }

  void moveToFindAccount() {}

  void moveToFindPassword() {}

  void moveToTerm() => moveToNext();

  void agree(bool? value) {
    if (_isAgree.value == false) {
      _isAgree(true);
    }
  }

  void disagree(bool? value) {
    if (_isAgree.value == true) {
      _isAgree(false);
    }
  }

  void signIn() async {
    kakaoLoginApi.kakaoSignIn().then((value) {
      _user.value = value;
    }).then((_) {
      Get.off(() => const HomeScreen());
      print(_user.value);
    });
  }

  void signOut() {
    kakaoLoginApi.signOut().then((_) {
      _loginPlatform = LoginPlatform.NONE;
      _user.value = null;
    });
  }
}
