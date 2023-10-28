import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hint;
  final Color color;
  final TextEditingController controller;
  final bool? obscureText;
  final Icon prefix;
  const LoginTextField(
      {super.key,
      required this.hint,
      required this.color,
      required this.controller,
      this.obscureText = false,
      required this.prefix});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      obscureText: obscureText!,
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefix,
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color, width: 2.0)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color))),
    );
  }
}
