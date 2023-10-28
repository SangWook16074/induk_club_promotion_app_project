import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/basic_box.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class SideMenu extends GetView<AppController> {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth < 800) {
        return Container();
      } else if (screenWidth < 1200) {
        return _buildTabletSideMenu();
      } else {
        return _buildDesktopSideMenu();
      }
    });
  }

  Widget _buildTabletSideMenu() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BasicBox(
        width: 100,
        child: Column(
          children: [
            _tabletMenuHeader(),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Divider(
                  color: Colors.white,
                )),
            _tabletMenus(),
          ],
        ),
      ),
    );
  }

  Widget _tabletMenuHeader() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          SignButton(
            child: const Icon(
              Icons.login,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => const Login(), binding: AuthBiding());
            },
          ),
        ],
      ),
    );
  }

  Widget _tabletMenus() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Icon(
            Icons.menu_book,
            size: 30,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildDesktopSideMenu() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BasicBox(
        width: 300,
        child: Column(
          children: [
            _menuHeader(),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                child: Divider(
                  color: Colors.white,
                )),
            _menus()
          ],
        ),
      ),
    );
  }

  Widget _menuHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '로그인이 필요합니다.',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SignButton(
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Color(0xffffffff), fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Get.to(() => const Login(), binding: AuthBiding());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _menus() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SideMenuItem(
            index: 0,
            label: '메인화면',
            icon: Icons.home_outlined,
            color: const Color(0xff1e1e1e),
            onTap: controller.moveToMain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SideMenuItem(
            index: 1,
            label: '동아리홍보글',
            icon: Icons.menu_book_outlined,
            color: const Color(0xff1e1e1e),
            onTap: controller.moveToPromotionPage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SideMenuItem(
            index: 2,
            label: '마이페이지',
            icon: Icons.account_circle_outlined,
            color: const Color(0xff1e1e1e),
            onTap: controller.moveToMypage,
          ),
        ),
      ],
    );
  }
}

class SideMenuItem extends GetView<AppController> {
  final int index;
  final String label;
  final void Function()? onTap;
  final IconData icon;
  final Color color;

  const SideMenuItem({
    Key? key,
    required this.label,
    this.onTap,
    required this.icon,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.pageIndex == index)
          ? _buildSelectItem()
          : _buildUnselectItem(),
    );
  }

  Widget _buildSelectItem() => _buildBasicItem(
        foregroundColor: const Color(0xff1e1e1e),
        backgroundColor: Colors.white,
      );

  Widget _buildUnselectItem() => _buildBasicItem(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xff1e1e1e).withOpacity(0.0));

  Widget _buildBasicItem({
    Color? foregroundColor,
    Color? backgroundColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
              child: Icon(
                icon,
                color: foregroundColor,
                size: 30,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                label,
                style: TextStyle(color: foregroundColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
