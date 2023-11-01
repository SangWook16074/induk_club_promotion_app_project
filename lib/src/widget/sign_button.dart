import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final void Function()? onPressed;

  const SignButton({
    super.key,
    this.onPressed,
    this.width = 100,
    this.height = 40,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Color(0xff713eff)),
          child: child),
    );
  }
}
