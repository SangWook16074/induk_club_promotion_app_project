import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/app.dart';
import 'package:induk_club_promotion_app_project/src/bindings/find_password_binding.dart';
import 'package:induk_club_promotion_app_project/src/bindings/resister_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/find_password.dart';
import 'package:induk_club_promotion_app_project/src/view/resister.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';

class LoginController extends GetxController {
  final TextEditingController passwordControllerAgain = TextEditingController();
  final Rxn<String> _token = Rxn<String>();
  final RxBool _isAgree = false.obs;
  final RxInt _index = 0.obs;
  final MemberRepository memberRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late final _user;

  LoginController({required this.memberRepository});

  int get pageIndex => _index.value;
  bool get isAgree => _isAgree.value;
  String? get token => _token.value;

  @override
  void onReady() {
    super.onReady();
    _user = Get.find<MemberController>();
    fetchTokenInfo();
  }

  void moveToFindAccount() {}
  void moveToFindPassword() {
    Get.to(() => const FindPassword(), binding: FindPasswordBinding());
  }

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
    print(token);
    _token(token);

    /// 사용자 정보 가져오기
    _user.fetchMemberData();
  }

  void fetchTokenInfo() {
    storage.read(key: "login").then((token) {
      if (token != null) {
        print(token);
        _token(token);
        _user.fetchMemberData();
      }
    });

    /// 사용자 정보 가져오기
  }

  ///로그인 요청 후
  ///토큰정보를 가져옴
  ///토큰이 없다면 로그인 실패
  ///토큰이 있다면 토큰 정보 저장

  void signIn(Map<String, dynamic> data) async {
    /// 이메일 반드시 입력

    try {
      final token = await memberRepository.signIn(data);
      if (token != null) {
        storeTokenInfo(token);
        Get.back();
      } else {
        showLoginErrorDialog();
      }
    } on Exception {
      showLoginErrorDialog();
    }
  }

  /// 로그아웃 시
  /// 토큰 정보 삭제

  void signOut() {
    const FlutterSecureStorage().delete(key: "login");
    _token.value = null;
    Get.offAll(() => const App());
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
