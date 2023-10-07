import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imagebox(),
          _loginbox(),
        ],
      ),
    );
  }

  Widget _imagebox() {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      color: Colors.red,
    );
  }

  Widget _loginbox() {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width / 2,
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("로그인창", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("로그인을 하기 원하신다면 ...", style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.3,
        bottom: MediaQuery.of(context).size.height * 0.2,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: AspectRatio(
          aspectRatio: 0.3,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            const Align(
              alignment: Alignment(0, -0.7),
              child: Text(
                "로그인",
                style: TextStyle(fontSize: 40),
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.35),
              child: Padding(
                padding: EdgeInsets.all(125.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "ID",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.35),
              child: Padding(
                padding: EdgeInsets.all(125.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "PW",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.75),
              child: Padding(
                padding: const EdgeInsets.all(125.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "아이디 찾기",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "비밀번호 찾기",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "회원가입",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    ]);
  }
}
