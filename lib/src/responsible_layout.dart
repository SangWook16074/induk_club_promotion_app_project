import 'package:flutter/material.dart';

class ResponsibleLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ResponsibleLayout({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return mobile;
      } else if (constraints.maxWidth < 1200) {
        return tablet;
      } else {
        return desktop;
      }
    });
  }
}
