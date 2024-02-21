import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/resister_complete.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';

class ResisterController extends GetxController {
  final RxBool _isAgree = false.obs;
  final Rxn<bool> _duplicate = Rxn<bool>();
  final RxBool _isEmailVerify = false.obs;
  late final String _code;
  String code = "";
  final MemberRepository repository;

  final RxInt _step = 0.obs;

  ResisterController({required this.repository});

  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordAgain = TextEditingController();
  final _verifyCode = TextEditingController();

  TextEditingController get email => _email;
  TextEditingController get name => _name;
  TextEditingController get password => _password;
  TextEditingController get passwordAgain => _passwordAgain;
  TextEditingController get verifyCode => _verifyCode;

  static ResisterController get to => Get.find();

  int get step => _step.value;
  bool get isAgree => _isAgree.value;
  bool? get duplicate => _duplicate.value;

  bool get isEmailVerify => _isEmailVerify.value;

  void nextStep() {
    _step.value++;
  }

  void agree(bool? value) {
    _isAgree(true);
  }

  void disagree(bool? value) {
    _isAgree(false);
  }

  /// 이메일이 중복되었는지 검사하는 로직
  /// 이메일을 서버에 전달하면
  /// 가입되어 있는지 판별해줌
  void checkEmailAvailable() async {
    /// 이메일은 빈칸이 허용 안됨
    if (_email.value.text == "") {
      showToast("이메일을 입력하세요 !");
      return;
    }

    final data = {"email": _email.value.text.toString()};
    final result = await repository.checkEmailAvailable(data);
    if (result == null) {
      showToast("에러가 발생했습니다. 잠시후에 다시 시도해주세요 !");
      return;
    } else {
      if (result) {
        showToast("이미 사용중인 이메일입니다.");
        _duplicate(result);
      } else {
        showToast("사용가능한 이메일입니다 !");
        _duplicate(result);
        emailVerify(data);
      }
    }
  }

  /// 이메일 인증 시도 메소드
  void emailVerify(Map<String, dynamic> data) async {
    final result = await repository.emailVerify(data);
    if (result == null) {
      showToast("에러가 발생했습니다. 잠시후에 다시 시도해주세요 !");
      return;
    } else {
      _code = result;
    }
  }

  void checkVerifyCode() {
    if (_verifyCode.value.text.toString() == '') {
      showToast("인증코드를 입력해주세요 !");
      return;
    }

    if (_verifyCode.value.text.toString() != _code) {
      showToast("잘못된 인증코드입니다.");
    } else {
      showToast("인증이 완료되었습니다 !");
      _isEmailVerify(true);
    }
  }

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
        Get.off(() => const ResisterComplete());
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
      );

  void showCancelDialog() => Get.dialog(CustomDialog(
        width: 300,
        title: "회원가입을 취소하시겠습니까?",
        confirm: () {
          Get.off(() => const LoginScreen());
        },
        cancel: () {
          Get.back();
        },
      ));

  void goToLast() {
    if (_name.value.text.toString() == "") {
      showToast("이름을 입력하세요 !");
      return;
    }

    if (_password.value.text.toString() == "") {
      showToast("비밀번호를 입력하세요 !");
      return;
    }

    if (_passwordAgain.value.text.toString() == "") {
      showToast("비밀번호 확인을 입력하세요 !");
      return;
    }

    if (_password.value.text.toString() !=
        _passwordAgain.value.text.toString()) {
      showToast("비밀번호가 서로 다릅니다 !");
      return;
    }

    _step.value++;
  }
}
