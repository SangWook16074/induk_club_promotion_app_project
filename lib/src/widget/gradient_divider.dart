import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.7,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          gradient: const LinearGradient(
              colors: [Color(0xff6600cc), Color(0xff9933ff)])),
    );
  }
}
