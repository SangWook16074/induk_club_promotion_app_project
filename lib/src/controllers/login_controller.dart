import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/kakao_login_api.dart';
import 'package:induk_club_promotion_app_project/src/view/home_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

enum LoginPlatform { KAKAO, GOOGLE, APPLE, NONE }

class LoginController extends GetxController {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController passwordControllerAgain = TextEditingController();
  final Rxn<Member> _user = Rxn<Member>();
  final RxBool _isAgree = false.obs;
  final RxInt _index = 0.obs;
  LoginPlatform _loginPlatform = LoginPlatform.NONE;
  final KakaoLoginApi kakaoLoginApi;
  LoginController({
    required this.kakaoLoginApi,
  });
  Member? get user => _user.value;
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

  void signInWithKakao() async {
    if (_loginPlatform != LoginPlatform.NONE) return;
    kakaoLoginApi.kakaoSignIn().then((user) {
      _user.value = Member.fromKakao(user);
    }).then((_) {
      Get.back();
      _loginPlatform = LoginPlatform.KAKAO;
      print(_user.value);
    });
  }

  void signInWithGoogle() {
    if (_loginPlatform != LoginPlatform.NONE) return;
    GoogleSignIn().signIn().then((user) {
      Get.back();

      _user.value = Member.fromGoogle(user!);
      _loginPlatform = LoginPlatform.GOOGLE;
      print(_user.value);
    });
  }

  void signOut() {
    switch (_loginPlatform) {
      case LoginPlatform.KAKAO:
        kakaoLoginApi.signOut().then((_) {
          _loginPlatform = LoginPlatform.NONE;
          _user.value = null;
        });

      case LoginPlatform.GOOGLE:
        GoogleSignIn().signOut().then((_) {
          _loginPlatform = LoginPlatform.NONE;
          _user.value = null;
        });
      default:
    }
  }
}
