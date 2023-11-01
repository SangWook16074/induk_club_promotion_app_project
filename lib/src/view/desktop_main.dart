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
      body: SingleChildScrollView(
        controller: controller.verticalController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _top(),
            const Divider(color: Colors.black),
            _iteams1(),
            _iteams2(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    return Row(
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
            Get.to(() => const Login(), binding: AuthBiding());
          },
          child: const Text("로그인", style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }

  Widget _iteams1() {
    return Column(
      children: [
        const SizedBox(
          width: 300,
          height: 100,
          child: TitleBox(
            label: '마감이 다되어 가요',
            fontSize: 25,
            type: TitleType.IMPORTANT,
          ),
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
    );
  }

  Widget _iteams2() {
    return const Column(
      children: [
        SizedBox(
            width: 300,
            height: 100,
            child: TitleBox(label: '동아리 더보기', fontSize: 25))
      ],
      // GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 3, crossAxisSpacing: 10),
      //     itemCount: 10,
      //     itemBuilder: (context, index) {
      //       return const SizedBox(
      //           height: 300,
      //           child: Padding(
      //             padding: EdgeInsets.all(10.0),
      //             child: PromotionItem(date: ' D - 9 '),
      //           ));
      //     })
    );
  }
}
