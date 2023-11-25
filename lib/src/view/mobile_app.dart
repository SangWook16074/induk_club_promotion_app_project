import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/bottom_nav_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_history.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_main.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_my_page.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';

class MobileApp extends GetView<AppController> {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController = BottomNavController();

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: bottomNavController.pageIndex,
          children: const [MobileMain(), MobileHistory(), MobileMyPage()],
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
                icon: Icon(Icons.history_toggle_off_outlined),
                activeIcon: Icon(Icons.history_toggle_off),
                label: ''),
            BottomNavigationBarItem(
                icon: ProfileImage(
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU",
                    type: ProfileType.ICON),
                activeIcon: ProfileImage(
                    url:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU",
                    type: ProfileType.ICONACTIVE),
                label: ''),
          ],
        ),
      ),
    );
  }
}
