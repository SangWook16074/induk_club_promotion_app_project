import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_main.dart';

class ResponsibleMain extends StatelessWidget {
  const ResponsibleMain({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return const MobileMain();
      } else {
        return const DesktopMain();
      }
    });
  }
}
