import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_app.dart';
import 'package:induk_club_promotion_app_project/src/view/tablet_main.dart';

class App extends GetView<AppController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsibleLayout(
        mobile: MobileApp(),
        tablet: TabletMain(),
        desktop: DesktopMain(),
      ),
    );
  }
}
