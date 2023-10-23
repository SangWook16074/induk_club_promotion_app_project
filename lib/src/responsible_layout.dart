import 'package:flutter/material.dart';

class ResponsibleLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsibleLayout(
      {super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth < 800) {
        return mobile;
      } else {
        return desktop;
      }
    });
  }
}
