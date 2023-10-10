import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const SignButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              transform: GradientRotation(3.14 * 0.3),
              colors: [Color(0xff34c6eb), Color(0xffe5d6ff)],
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
                color: Color(0xff4e4e4e), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
