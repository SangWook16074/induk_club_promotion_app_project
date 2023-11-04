import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopMain extends GetView<PromotionController> {
  const DesktopMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: Get.find<AppController>().verticalController,
        slivers: [
          // const Divider(color: Colors.black),
          _appBar(),
          _iteams1(),
          _iteams2(),
          _more(),
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
            Row(
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
                ))
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
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.height * 0.35),
      sliver: Obx(
        () => SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.8,
            ),
            itemCount: 30,
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
}
