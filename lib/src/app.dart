import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const MobileMain();
      } else {
        return const DesktopMain();
      }
    });
  }
}
