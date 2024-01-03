import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final bool? obscureText;
  final Icon? prefixIcon;
  final String? hintText;
  const LoginTextField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.hintText,
    this.type,
  });

  String? get hintLabel {
    if (hintText != null) {
      return hintText;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText!,
      style: const TextStyle(
        color: Color(0xff4d4d4d),
        fontSize: 15,
      ),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          isDense: true,
          hintStyle: const TextStyle(color: Color(0xffbdbdbd), fontSize: 16),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff713eff), width: 2.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff713eff)))),
    );
  }
}
