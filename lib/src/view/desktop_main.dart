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
          // _more(),
        ],
      ),
    );
  }

  Widget _top() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
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
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PromotionItem(date: ' D - 9 '),
                    )),
              ))
        ],
      ),
    );
  }

  Widget _iteams2() {
    return const SliverToBoxAdapter(
      child: Column(children: [
        SizedBox(
            width: 300,
            height: 100,
            child: TitleBox(label: '동아리 더보기', fontSize: 25)),
      ]),
    );
  }

  Widget _more() {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => const PromotionItem(
              date: 'D-9',
              showDday: false,
            ));
  }
}
