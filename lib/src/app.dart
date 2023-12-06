import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/page_view_controller.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/home_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
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
                  )),
      ),
    );
  }

  Widget _buildBody() => IndexedStack(
        index: controller.pageIndex,
        children: [
          const HomeScreen(),
          const MyPage(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          )
        ],
      );
}
