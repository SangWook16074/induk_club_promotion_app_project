import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController passwordControllerAgain = TextEditingController();
  final RxBool _isAgree = false.obs;
  final RxInt _index = 0.obs;

  int get index => _index.value;
  bool get isAgree => _isAgree.value;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void moveToNext() => _index.value++;

  void moveToPrev() => _index.value--;

  void moveToFindAccount() {}

  void moveToFindPassword() {}

  void moveToSignUp() => moveToNext();

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
}
