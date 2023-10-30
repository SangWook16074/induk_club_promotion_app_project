import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobileMain extends GetView<AppController> {
  const MobileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _drawer(),
      appBar: AppBar(
        title: const Text('LOGO'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff1e1e1e),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        controller: controller.verticalController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            _header(),
            _moreItems(),
          ],
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      backgroundColor: const Color(0xff1e1e1e),
      child: Column(
        children: [
          _drawerHeader(),
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
                Get.to(() => const Login(), binding: LoginBinding());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() => Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
            child: Row(
              children: [
                TitleBox(
                    type: TitleType.IMPORTANT,
                    label: "마감이 다 되어가요",
                    fontSize: 25)
              ],
            ),
          ),
          CarouselSlider.builder(
              itemCount: 30,
              itemBuilder: (context, index, realIndex) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                        onTap: controller.moveToPromotionView,
                        child: const PromotionItem(
                          title: '동아리 명',
                          discription: '동아리 소개글',
                          date: 'D-9',
                        )),
                  ),
              options: CarouselOptions(
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  aspectRatio: 1)),
        ],
      );

  Widget _moreItems() => Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
          child: Row(
            children: [
              TitleBox(type: TitleType.NORMAL, label: "동아리 더보기", fontSize: 25)
            ],
          ),
        ),
        ...List.generate(
          20,
          (index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: GestureDetector(
                onTap: controller.moveToPromotionView,
                child: const PromotionItem(
                  title: '동아리 명',
                  discription: '동아리 소개글',
                  date: 'D-9',
                )),
          ),
        ),
      ]);
}
