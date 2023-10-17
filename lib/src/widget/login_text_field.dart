import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hint;

  final TextEditingController controller;
  final bool? obscureText;
  final Icon prefix;
  const LoginTextField(
      {super.key,
      required this.hint,
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
          prefixIconColor: Colors.white,
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
