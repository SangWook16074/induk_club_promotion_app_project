import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  const LoginTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText!,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: const InputDecoration(
          isDense: true,
          hintStyle: TextStyle(color: Color(0xff1e1e1e)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff713eff), width: 2.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff713eff)))),
    );
  }
}
