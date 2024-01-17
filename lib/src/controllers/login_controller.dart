import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/resister_binding.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/resister.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';

class LoginController extends GetxController {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController passwordControllerAgain = TextEditingController();
  final Rxn<String> _token = Rxn<String>();
  final RxBool _isAgree = false.obs;
  final RxInt _index = 0.obs;
  final MemberRepository memberRepository;
  final FlutterSecureStorage storage;
  LoginController({required this.storage, required this.memberRepository});

  int get pageIndex => _index.value;
  bool get isAgree => _isAgree.value;
  String? get token => _token.value;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @override
  void onReady() {
    super.onReady();
    fetchTokenInfo();
  }

  void moveToFindAccount() {}
  void moveToFindPassword() {}

  /// 이용약관 동의 여부
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

  /// 로그인 토큰이 유효하다면
  /// 토큰 정보를 저장하고
  /// 메인화면으로 돌아감
  void storeTokenInfo(String token) async {
    await storage.write(key: "login", value: token);
    _token(token);
  }

  void fetchTokenInfo() {
    storage.read(key: "login").then((token) {
      if (token != null) {
        print(token);
        _token(token);
      }
    });
  }

  ///로그인 요청 후
  ///토큰정보를 가져옴
  ///토큰이 없다면 로그인 실패
  ///토큰이 있다면 토큰 정보 저장

  void signIn() async {
    /// 이메일 반드시 입력
    if (emailController.value.text == '') {
      Get.snackbar("로그인 정보 에러", "계정을 입력해주세요 !",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    /// 비밀번호 반드시 입력
    if (passwordController.value.text == '') {
      Get.snackbar("로그인 정보 에러", "비밀번호를 입력하세요",
          snackPosition: SnackPosition.BOTTOM);
    }

    final data = {
      "email": _emailController.text.toString(),
      "password": _passwordController.text.toString(),
    };
    final token = await memberRepository.signIn(data);
    if (token != null) {
      storeTokenInfo(token);
      emailController.clear();
      passwordController.clear();
      Get.back();
    } else {
      showLoginErrorDialog();
    }
  }

  /// 로그아웃 시
  /// 토큰 정보 삭제

  void signOut() {
    const FlutterSecureStorage().delete(key: "login");
    _token.value = null;
    Get.back();
  }

  ///회원가입 화면으로
  ///이동하는 메소드
  void moveToResister() {
    Get.to(() => const Resister(), binding: ResisterBinding());
  }

  ///로그아웃 시
  ///사용자에게 로그아웃을
  ///할것인지 물어보는 다이얼로그
  void showSignOutDialog() => Get.dialog(CustomDialog(
        width: 300,
        title: "로그아웃 하시겠습니까?",
        confirm: () {
          signOut();
        },
        cancel: () {
          Get.back();
        },
      ));

  ///로그인 정보가
  ///일치하지 않은 경우
  ///보여주는 스낵바
  void showLoginErrorDialog() => Get.snackbar("로그인 에러", "로그인 정보가 일치하지 않습니다");
}
