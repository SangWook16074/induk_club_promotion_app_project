import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobilePromotionView extends StatelessWidget {
  const MobilePromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: AppBar(
              backgroundColor: const Color(0xff1e1e1e).withOpacity(0.7),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
          Align(alignment: Alignment.bottomCenter, child: _infoBox())
        ],
      ),
    );
  }

  Widget _title() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '신규 동아리원(디자인) 추가모집',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ));
  }

  Widget _img() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => Container(
                  height: 400,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.grey,
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              TitleBox(
                type: TitleType.IMPORTANT,
                label: '모집기간',
                fontSize: 20,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    '2023.09.23 - 2023.09.30',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _object() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '모집인원', fontSize: 20)],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text(
                  '00명',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _info() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '활동내용', fontSize: 20)],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  Widget _target() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '우대학과', fontSize: 20)],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text(
                  '학과 무관',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _period() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '활동기간', fontSize: 20)],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Text(
                  '2023년 3월 10일 - 2024년 1월 10일',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _infoBox() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          height: Get.size.height * 0.3,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xff3e3e3e).withOpacity(0.7),
                  const Color(0xff2e2e2e).withOpacity(0.9),
                ]),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'A&I',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '동아리 개설일',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '2023년 1월 10일',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '동아리 분류',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '교내동아리',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
