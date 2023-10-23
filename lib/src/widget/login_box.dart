import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';

class LoginBox extends StatelessWidget {
  final double lenght;
  final TextEditingController id;
  final TextEditingController password;
  final void Function()? moveToFindAccount;
  final void Function()? moveToFindPassword;
  final void Function()? moveToSignUp;
  const LoginBox(
      {super.key,
      required this.lenght,
      required this.id,
      required this.password,
      this.moveToFindAccount,
      this.moveToFindPassword,
      this.moveToSignUp});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          width: lenght,
          height: lenght,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(width: 3.0, color: Colors.white),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _logo(),
              _body(),
              _button(),
              _others(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return const Icon(
      Icons.lock,
      color: Color(0xff6600cc),
      size: 100,
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: LoginTextField(
                prefix: const Icon(
                  Icons.email,
                  color: Color(0xff1e1e1e),
                ),
                hint: '계정',
                controller: id)),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: LoginTextField(
              prefix: const Icon(
                Icons.lock,
                color: Color(0xff1e1e1e),
              ),
              hint: '패스워드',
              controller: password,
              obscureText: true,
            )),
      ],
    );
  }

  Widget _others() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: moveToFindAccount,
              child: const Text(
                '아이디 찾기',
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: moveToFindPassword,
              child: const Text(
                '비밀번호 찾기',
                style: TextStyle(color: Colors.white),
              )),
          TextButton(
              onPressed: moveToSignUp,
              child: const Text(
                '회원가입',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () {}, child: const Text('로그인'))),
    );
  }
}
