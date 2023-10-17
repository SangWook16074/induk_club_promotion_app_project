import 'package:flutter/material.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_main.dart';
import 'package:induk_club_promotion_app_project/src/view/tablet_main.dart';

class ResponsibleMain extends StatelessWidget {
  const ResponsibleMain({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth < 1000) {
        return const MobileMain();
      } else if (screenWidth < 1200) {
        return const TabletMain();
      } else {
        return const DesktopMain();
      }
    });
  }
}
