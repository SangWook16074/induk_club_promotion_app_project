import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_main.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_my_page.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_my_page.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_page.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu.dart';

class App extends GetView<AppController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //   Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: AssetImage('assets/images/background.jpg'))),
          // child:
          Row(
        children: [
          _sideMenu(),
          Expanded(
              flex: 8,
              child: Obx(
                () => IndexedStack(
                  index: controller.pageIndex,
                  children: const [
                    ResponsibleLayout(
                      mobile: MobileMain(),
                      tablet: DesktopMain(),
                      desktop: DesktopMain(),
                    ),
                    PromotionPage(),
                    ResponsibleLayout(
                      mobile: MobileMyPage(),
                      tablet: DesktopMyPage(),
                      desktop: DesktopMyPage(),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return const SideMenu();
  }
}
