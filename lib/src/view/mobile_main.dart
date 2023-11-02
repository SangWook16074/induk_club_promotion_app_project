import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobileMain extends GetView<AppController> {
  const MobileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
