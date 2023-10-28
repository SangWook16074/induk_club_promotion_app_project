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
    return Container(
      width: lenght,
      height: lenght,
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.white),
          borderRadius: BorderRadius.circular(24.0),
          color: Colors.white.withOpacity(0.1)),
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
    );
  }

  Widget _logo() {
    return const Icon(
      Icons.lock,
      color: Colors.white,
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
                prefix: const Icon(Icons.email),
                hint: '계정',
                color: Colors.white,
                controller: id)),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: LoginTextField(
              prefix: const Icon(Icons.lock),
              hint: '패스워드',
              color: Colors.white,
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
          TextButton(onPressed: moveToFindAccount, child: const Text('아이디 찾기')),
          TextButton(
              onPressed: moveToFindPassword, child: const Text('비밀번호 찾기')),
          TextButton(onPressed: moveToSignUp, child: const Text('회원가입')),
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
