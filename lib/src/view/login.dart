import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/widget/login_box.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController id;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    id = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    id.dispose();
    password.dispose();
  }

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
      width: MediaQuery.of(context).size.width - 800,
      color: const Color(0xff2e2e2e),
    );
  }

  Widget _loginbox() {
    return Container(
      width: 800,
      padding: const EdgeInsets.all(30.0),
      color: const Color(0xff4e4e4e),
      alignment: Alignment.center,
      child: LoginBox(
        lenght: 400,
        id: id,
        password: password,
      ),
    );
  }
}
