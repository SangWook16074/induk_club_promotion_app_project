import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_main.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu.dart';

class App extends GetView<AppController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.jpg'))),
      child: Row(
        children: [
          _sideMenu(),
          const Expanded(flex: 8, child: ResponsibleMain()),
        ],
      ),
    ));
  }

  Widget _sideMenu() {
    return const SideMenu();
  }
}
