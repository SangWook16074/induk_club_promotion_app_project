import 'package:flutter/material.dart';

class ResponsibleLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final double tabletToDesktop;
  final double mobiletoTablet;
  const ResponsibleLayout(
      {super.key,
      required this.mobile,
      required this.desktop,
      this.tabletToDesktop = 800,
      required this.tablet,
      this.mobiletoTablet = 1000});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth < mobiletoTablet) {
        return mobile;
      } else if (screenWidth < tabletToDesktop) {
        return tablet;
      } else {
        return desktop;
      }
    });
  }
}
