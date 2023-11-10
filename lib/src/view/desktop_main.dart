import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';

import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';

import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopMain extends GetView<PromotionController> {
  const DesktopMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 500,
            color: Color(0xff713eff),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('LOGO', style: Get.textTheme.displayLarge),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const ProfileImage(
                        length: 80,
                        url:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkWOsW52fToB1DAeOOFCC8MnOqV4djsYkYrw&usqp=CAU',
                        type: ProfileType.MYPAGE,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('로그아웃', style: Get.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => (controller.promotions.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Expanded(
                    child: Center(
                      child: CustomScrollView(
                        controller:
                            Get.find<AppController>().verticalController,
                        slivers: [
                          _appBar(),
                          _header(),
                          _headerItem(),
                          _iteams2(),
                          _more(),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.15),
        child: const Column(
          children: [
            Row(
              children: [
                TitleBox(
                  label: '마감이 다되어 가요',
                  fontSize: 20,
                  type: TitleType.IMPORTANT,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iteams2() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.15),
        child: const Column(children: [
          Row(
            children: [
              TitleBox(label: '동아리 더보기', fontSize: 25),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _more() {
    return Obx(
      () => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.15),
        sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.8,
            ),
            itemCount: controller.promotions.length,
            itemBuilder: (context, index) => Obx(() {
                  final promotion = controller.promotions[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PromotionItem(
                      promotion: promotion,
                      date: ' D - 9 ',
                      showDday: false,
                    ),
                  );
                })),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: false,
      floating: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leadingWidth: 200,
      leading: const Center(
        child: Text(
          'LOGO',
          style: TextStyle(fontSize: 25),
        ),
      ),
      title: SearchTextField(
          controller: Get.find<AppController>().searchController,
          type: SearchBarType.DESKTOP),
      actions: [
        TextButton(
          onPressed: () {
            Get.to(() => const Login(), binding: LoginBinding());
          },
          child: const Text("로그인", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Widget _headerItem() {
    return Obx(
      () => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.15),
        sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8),
            itemCount: controller.promotions.length,
            itemBuilder: (context, index) => Obx(() {
                  final promotion = controller.promotions[index];
                  return PromotionItem(date: "D - 9", promotion: promotion);
                })),
      ),
    );
  }
}
