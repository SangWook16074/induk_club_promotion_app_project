import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/bottom_nav_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_my_page.dart';

class MobileApp extends GetView<AppController> {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController = BottomNavController();

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: bottomNavController.pageIndex,
          children: [
            const MobileMain(),
            Container(
              color: Colors.red,
            ),
            const MobileMyPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: bottomNavController.pageIndex,
          selectedItemColor: const Color(0xff713eff),
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: bottomNavController.changeIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_membership_outlined),
                activeIcon: Icon(Icons.card_membership),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle),
                label: ''),
          ],
        ),
      ),
    );
  }
}
