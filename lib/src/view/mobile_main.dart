import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/logo.dart';
import 'package:induk_club_promotion_app_project/src/widget/move_to_up_fab.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/side_menu.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

import '../widget/promotion_item.dart';

class MobileMain extends GetView<AppController> {
  const MobileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: AppBar(
              backgroundColor: const Color(0xff1e1e1e).withOpacity(0.7),
            ),
          ),
        ),
      ),
      floatingActionButton: MoveToUpFab(
        onPressed: controller.moveToUp,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/red_white.jpg'))),
        child: SingleChildScrollView(
          controller: controller.verticalController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              _banner(),
              _searchBar(),
              _items(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return const Padding(padding: EdgeInsets.all(20.0), child: Logo());
  }

  // 동아리 프로모션 글 검색용 검색바
  Widget _searchBar() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchTextField(
            controller: controller.searchController,
            type: SearchBarType.MOBILE));
  }

  // 동아리 프로모션 글
  Widget _items() {
    return Column(
      children: List.generate(
          30,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: controller.moveToPromotionView,
                    child: const PromotionItem(
                      title: '동아리 명',
                      discription: '동아리 소개글',
                      date: 'D-9',
                    )),
              )),
    );
  }

  Widget _drawer() {
    return Drawer(
      backgroundColor: const Color(0xff1e1e1e),
      child: Column(
        children: [
          _drawerHeader(),
          _menus(),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
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
