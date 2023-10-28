import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  final String label;
  final double fontSize;
  const TitleBox({super.key, required this.label, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xff1e1e1e).withOpacity(0.8)),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
    );
  }
}
