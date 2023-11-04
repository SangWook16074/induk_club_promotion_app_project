import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopMain extends GetView<AppController> {
  const DesktopMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller.verticalController,
        slivers: [
          _top(),
          // const Divider(color: Colors.black),
          _iteams1(),
          _iteams2(),
          _more(),
        ],
      ),
    );
  }

  Widget _top() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'LOGO',
                style: TextStyle(fontSize: 25),
              )),
          SearchTextField(
              controller: controller.searchController,
              type: SearchBarType.DESKTOP),
          TextButton(
            onPressed: () {
              Get.to(() => const Login(), binding: LoginBinding());
            },
            child: const Text("로그인", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _iteams1() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const TitleBox(
            label: '마감이 다되어 가요',
            fontSize: 20,
            type: TitleType.IMPORTANT,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => const SizedBox(
                    height: 500,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PromotionItem(
                          title: '동아리 명',
                          discription: '동아리 소개',
                          date: ' D - 9 '),
                    )),
              ))
        ],
      ),
    );
  }

  Widget _iteams2() {
    return const SliverToBoxAdapter(
      child: Column(children: [
        TitleBox(label: '동아리 더보기', fontSize: 25),
      ]),
    );
  }

  Widget _more() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.height * 0.35),
      sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 0.8,
          ),
          itemCount: 30,
          itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(10.0),
                child: PromotionItem(
                  title: '동아리 명',
                  discription: '동아리 소개',
                  date: ' D - 9 ',
                  showDday: false,
                ),
              )),
    );
  }
}
