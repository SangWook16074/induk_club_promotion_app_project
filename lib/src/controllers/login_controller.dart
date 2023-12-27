import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/resister_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/resister_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/google_login_api.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/kakao_login_api.dart';
import 'package:induk_club_promotion_app_project/src/view/resister.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
  final GoogleLoginApi googleLoginApi;
  LoginController({required this.kakaoLoginApi, required this.googleLoginApi});

  Member? get user => _user.value;
  int get pageIndex => _index.value;
  bool get isAgree => _isAgree.value;
  LoginPlatform get loginPlatform => _loginPlatform;
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

  void signInWithKakao() {
    if (_loginPlatform != LoginPlatform.NONE) return;
    kakaoLoginApi.kakaoSignIn().then((user) {
      _user.value = user;
      print(_user.value);
    }).then((_) {
      Get.back();
      _loginPlatform = LoginPlatform.KAKAO;
    });
  }

  void signInWithGoogle() {
    if (_loginPlatform != LoginPlatform.NONE) return;
    googleLoginApi.googleSignIn().then((user) {
      if (user == null) {
        return;
      } else {
        _user.value = user;
        _loginPlatform = LoginPlatform.GOOGLE;
        Get.back();
      }
    }).onError((error, stackTrace) {
      if (error is PlatformException) return;
      print(error);
    });
  }

  void signInWithApple() {
    SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.fullName,
    ]).then((AuthorizationCredentialAppleID user) {
      _user.value = Member.fromApple(user);
      _loginPlatform = LoginPlatform.APPLE;
      Get.back();
    }).onError((error, stackTrace) {
      if (error is PlatformException) return;
      print(error);
    });
  }

  void signOut() {
    switch (_loginPlatform) {
      case LoginPlatform.KAKAO:
        kakaoLoginApi.signOut();
        break;
      case LoginPlatform.GOOGLE:
        googleLoginApi.signOut();
        break;
      case LoginPlatform.APPLE:
      default:
        break;
    }
    _loginPlatform = LoginPlatform.NONE;
    _user.value = null;
  }

  void moveToResister() {
    Get.to(() => const Resister(), binding: ResisterBinding());
  }
}
