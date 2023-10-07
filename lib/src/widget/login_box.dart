import 'package:flutter/material.dart';

class LoginBox extends StatelessWidget {
  final double lenght;
  final TextEditingController id;
  final TextEditingController password;

  const LoginBox(
      {super.key,
      required this.lenght,
      required this.id,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lenght,
      height: lenght,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        color: Colors.white,
        elevation: 30.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '로그인',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextField(
                controller: id,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextField(
                controller: password,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const Text('아이디 찾기')),
                  TextButton(onPressed: () {}, child: const Text('비밀번호 찾기')),
                  TextButton(onPressed: () {}, child: const Text('회원가입')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
