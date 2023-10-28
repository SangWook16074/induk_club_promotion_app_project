import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_text_field.dart';

class AccountBox extends StatelessWidget {
  final double lenght;
  final TextEditingController id;
  final TextEditingController password;
  final void Function()? moveToNext;
  const AccountBox(
      {super.key,
      required this.lenght,
      required this.id,
      required this.password,
      this.moveToNext});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          width: lenght,
          height: lenght,
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.white),
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.white.withOpacity(0.025)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 8, child: _body()),
              Expanded(flex: 2, child: _button()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: LoginTextField(
                prefix: const Icon(Icons.email),
                hint: 'E-mail',
                controller: id)),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: LoginTextField(
              prefix: const Icon(Icons.lock),
              hint: '패스워드',
              controller: password,
              obscureText: true,
            )),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: LoginTextField(
              prefix: const Icon(Icons.lock),
              hint: '패스워드 확인',
              controller: password,
              obscureText: true,
            )),
      ],
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SizedBox(
          width: double.infinity,
          child:
              ElevatedButton(onPressed: moveToNext, child: const Text('다음'))),
    );
  }
}
