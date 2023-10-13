import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/rive_image.dart';

class CompleteBox extends StatelessWidget {
  final double lenght;
  final void Function()? moveToLogin;
  const CompleteBox({super.key, required this.lenght, this.moveToLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lenght,
      height: lenght,
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          border: Border.all(width: 3.0, color: Colors.white),
          borderRadius: BorderRadius.circular(24.0),
          color: Colors.white.withOpacity(0.1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(opacity: 0, child: _body()),
                _logo(),
                _body(),
              ],
            ),
          ),
          Expanded(flex: 2, child: _button()),
        ],
      ),
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RiveImage(path: RiveImagePath.complete, width: 100, heigth: 100),
    );
  }

  Widget _body() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('가입이 완료되었습니다 ! 이메일 인증 후 사용가능합니다.'),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: moveToLogin,
          child: const Text('로그인하기'),
        ),
      ),
    );
  }
}
