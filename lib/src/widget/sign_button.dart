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
      onTap: (onPressed != null) ? onPressed : null,
      child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: (onPressed != null) ?  const Color(0xff713eff) : const Color(0xff4d4d4d),
              borderRadius: BorderRadius.circular(8.0)),
          child: child),
    );
  }
}
