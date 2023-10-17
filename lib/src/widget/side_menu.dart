import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (screenWidth < 1000) {
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
                color: const Color(0xff1e1e1e).withOpacity(0.8),
                border: Border.all(width: 1.0, color: Colors.black),
                borderRadius: BorderRadius.circular(30.0)),
            child: Column(
              children: [
                _tabletMenuHeader(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SignButton(
                    label: 'Login',
                    onPressed: () {
                      Get.to(() => const Login());
                    },
                  ),
                ),

                const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                    child: Divider(
                      color: Colors.white,
                    )),
                _tabletMenus(),
                // const Padding(
                //     padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                //     child: GradientDivider()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabletMenuHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.account_circle_rounded,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _tabletMenus() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu_book,
            size: 40,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.account_circle_outlined,
            size: 40,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildDesktopSideMenu() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
                color: const Color(0xff1e1e1e).withOpacity(0.8),
                border: Border.all(width: 1.0, color: Colors.black),
                borderRadius: BorderRadius.circular(30.0)),
            child: Column(
              children: [
                _menuHeader(),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                    child: Divider(
                      color: Colors.white,
                    )),
                _menus()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
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
    );
  }

  Widget _menus() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SideMenuItem(
            label: '메인화면',
            icon: Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.white,
            ),
            color: Color(0xff1e1e1e),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SideMenuItem(
            label: '동아리홍보글',
            icon: Icon(
              Icons.menu_book_outlined,
              size: 30,
              color: Colors.white,
            ),
            color: Color(0xff1e1e1e),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SideMenuItem(
            label: '마이페이지',
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: Colors.white,
            ),
            color: Color(0xff1e1e1e),
          ),
        ),
      ],
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Widget icon;
  final Color color;

  const SideMenuItem({
    Key? key,
    required this.label,
    this.onTap,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
          child: icon,
        ),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
