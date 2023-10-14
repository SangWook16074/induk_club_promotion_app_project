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
              colors: [Color(0xff6600cc), Color(0xff9933ff)],
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
                color: Color(0xffffffff), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
