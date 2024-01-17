import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/resister_binding.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/resister.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';

enum LoginPlatform { KAKAO, GOOGLE, APPLE, NONE }

class LoginController extends GetxController {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController passwordControllerAgain = TextEditingController();
  final Rxn<Member> _user = Rxn<Member>();
  final Rxn<String> _token = Rxn<String>();
  final RxBool _isAgree = false.obs;
  final RxInt _index = 0.obs;
  final LoginPlatform _loginPlatform = LoginPlatform.NONE;
  final MemberRepository memberRepository;
  LoginController({required this.memberRepository});

  Member? get user => _user.value;
  int get pageIndex => _index.value;
  bool get isAgree => _isAgree.value;
  String? get token => _token.value;
  LoginPlatform get loginPlatform => _loginPlatform;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @override
  void onReady() {
    super.onReady();
    fetchTokenInfo();
  }

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

  void fetchTokenInfo() async {
    final token = await const FlutterSecureStorage().read(key: "login");
    print(token);
    _token(token);
  }

  void signIn() async {
    final data = {
      "email": _emailController.text.toString(),
      "password": _passwordController.text.toString(),
    };
    if (_loginPlatform != LoginPlatform.NONE) return;
    await memberRepository.signIn(data);
    fetchTokenInfo();
    Get.back();
  }

  void signOut() {
    const FlutterSecureStorage().delete(key: "login");
    _token.value = null;
    Get.back();
  }

  void moveToResister() {
    Get.to(() => const Resister(), binding: ResisterBinding());
  }

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
}
