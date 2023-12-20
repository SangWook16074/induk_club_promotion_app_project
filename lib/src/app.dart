import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/page_view_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/home_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/my_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/all_promotion.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu.dart';

class App extends GetView<PageViewController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Obx(
        () => Scaffold(
          body: (ResponsibleLayout.isMobile(context))
              ? _buildBody()
              : Row(
                  children: [
                    const SideMenu(),
                    Expanded(child: _buildBody()),
                  ],
                ),
          bottomNavigationBar: (ResponsibleLayout.isMobile(context))
              ? GetX<PageViewController>(builder: (controller) {
                  return BottomNavigationBar(
                    elevation: 0.0,
                    currentIndex: controller.pageIndex,
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    selectedItemColor: const Color(0xff713eff),
                    unselectedItemColor: Colors.black,
                    onTap: controller.changeIndex,
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          activeIcon: Icon(Icons.home),
                          label: '홈'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.my_library_books_outlined),
                          activeIcon: Icon(Icons.my_library_books),
                          label: '홍보글'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.contact_page_outlined),
                          activeIcon: Icon(Icons.contact_page),
                          label: '내가쓴글'),
                      BottomNavigationBarItem(
                          icon: ProfileImage(type: ProfileType.ICON),
                          activeIcon:
                              ProfileImage(type: ProfileType.ICONACTIVE),
                          label: '마이페이지'),
                    ],
                  );
                })
              : null,
        ),
      ),
    );
  }

  Widget _buildBody() => IndexedStack(
        index: controller.pageIndex,
        children: const [
          HomeScreen(),
          MyPromotionView(),
          AllPromotion(),
          MyPage(),
        ],
      );
}
