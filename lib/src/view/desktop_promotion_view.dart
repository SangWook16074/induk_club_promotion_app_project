import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopPromotionView extends GetView<PromotionController> {
  const DesktopPromotionView({super.key});

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
                  _deadline(),
                  _object(),
                  _target(),
                  _period(),
                  _info(),
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

  Widget _deadline() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        TitleBox(
                          label: '모집분야',
                          fontSize: 20,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        children: [
                          Text('백엔드/디자인', style: Get.textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        TitleBox(
                          label: '모집기간',
                          fontSize: 20,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        children: [
                          Text('2023.09.23 - 2023.09.30',
                              style: Get.textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                Text('00명', style: Get.textTheme.bodyLarge),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '활동내용', fontSize: 20)],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                  '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.'
                  '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.'
                  '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.'
                  'UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.'
                  'UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.'
                  '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.'
                  'UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.'
                  '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.'
                  'UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.'
                  '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.'
                  'UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.',
                  style: Get.textTheme.bodyLarge))
        ],
      ),
    );
  }

  Widget _target() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          const Row(
            children: [TitleBox(label: '우대학과', fontSize: 20)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text('학과 무관', style: Get.textTheme.bodyLarge),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _period() {
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
                Text('2023년 3월 10일 - 2024년 1월 10일',
                    style: Get.textTheme.bodyLarge),
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
                        Text('동아리 개설일', style: Get.textTheme.displayMedium)
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
                          style: Get.textTheme.displayMedium,
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
