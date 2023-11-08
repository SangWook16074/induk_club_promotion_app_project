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
      body: Row(
        children: [
          Container(
            height: 400,
            width: 300,
            color: Color(0xff713eff),
            child: Column(
              children: [
                Text(
                  'LOGO',
                  style: Get.textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    const ProfileImage(
                        length: 100,
                        url:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkWOsW52fToB1DAeOOFCC8MnOqV4djsYkYrw&usqp=CAU',
                        type: ProfileType.MYPAGE),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '로그아웃',
                        style: Get.textTheme.displaySmall,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        '마이페이지',
                        style: Get.textTheme.displaySmall,
                      ),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.collections_bookmark, color: Colors.white),
                      title: Text(
                        '내가 쓴 글',
                        style: Get.textTheme.displaySmall,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.edit_square, color: Colors.white),
                      title: Text(
                        '동아리 홍보 글 작성하기',
                        style: Get.textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => (controller.promotions.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : CustomScrollView(
                    controller: Get.find<AppController>().verticalController,
                    slivers: [
                      // const Divider(color: Colors.black),

                      _appBar(),
                      _iteams1(),
                      _iteams2(),
                      _more(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _iteams1() {
    return SliverToBoxAdapter(
      child: Obx(
        () => Column(
          children: [
            const TitleBox(
              label: '마감이 다되어 가요',
              fontSize: 20,
              type: TitleType.IMPORTANT,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.promotions.length,
                    (index) => Obx(() {
                      final promotion = controller.promotions[index];
                      return SizedBox(
                          height: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: PromotionItem(
                                promotion: promotion, date: ' D - 9 '),
                          ));
                    }),
                  )),
            )
          ],
        ),
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
    return SliverGrid.builder(
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
            }));
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: false,
      floating: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: const Text(
        'LOGO',
        style: TextStyle(fontSize: 25),
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

  Widget _side() {
    return Container(
      height: 400,
      width: 300,
    );
  }
}
