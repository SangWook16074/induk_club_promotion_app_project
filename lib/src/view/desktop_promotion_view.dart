import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopPromotionView extends GetView<PromotionController> {
  final Promotion promotion;
  const DesktopPromotionView({super.key, required this.promotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('LOGO', style: Get.textTheme.displayLarge),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 200, right: 400),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  _img(),
                  _title(),
                  _closeAt(),
                  _beginToEnd(),
                  _object(),
                  _content(),
                  _contentOfAcivity(),
                ],
              ),
            ),
          ),
          Positioned(right: 100, child: _infoBox()),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('신규 동아리원(디자인) 추가모집', style: Get.textTheme.displayLarge),
              ],
            ),
            const Divider(
              color: Color(0xffE6E6E6),
            )
          ],
        ));
  }

  Widget _img() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: SizedBox(
        child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => Container(
                  height: 400,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: const Color(0xffE6E6E6),
                  child: Text('이미지 ${index + 1}'),
                ),
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 1.5,
              autoPlay: true,
            )),
      ),
    );
  }

  Widget _closeAt() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: SizedBox(
          child: Column(
            children: [
              const Row(
                children: [
                  TitleBox(
                    label: '모집마감',
                    fontSize: 20,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  children: [
                    Text(promotion.closeAt.toString(),
                        style: Get.textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _object() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '모집인원', fontSize: 20)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text('${promotion.requiredPeople}명',
                    style: Get.textTheme.bodyMedium),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '동아리소개', fontSize: 20)],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(promotion.content, style: Get.textTheme.bodyMedium))
        ],
      ),
    );
  }

  Widget _contentOfAcivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '활동내용', fontSize: 20)],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(promotion.contentOfActivity,
                  style: Get.textTheme.bodyMedium))
        ],
      ),
    );
  }

  Widget _beginToEnd() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '활동기간', fontSize: 20)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text('${promotion.begin} - ${promotion.end}',
                    style: Get.textTheme.bodyMedium),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffE6E6E6),
                    Color(0xffE6E6E6),
                  ]),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: const Offset(0, 200), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'A&I',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Color(0xff713eff),
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xff713eff),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('동아리 개설일', style: Get.textTheme.headlineMedium)
                      ],
                    ),
                    Row(
                      children: [
                        Text('2023년 1월 10일', style: Get.textTheme.bodyMedium)
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '동아리 분류',
                          style: Get.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '교내동아리',
                          style: Get.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ],
                ),
                const Row(children: [
                  Expanded(
                    child: SignButton(
                      width: double.infinity,
                      height: 45,
                      child: Text(
                        '지원하기',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
