import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class TabletPromotionView extends StatelessWidget {
  const TabletPromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('LOGO', style: Get.textTheme.displayLarge),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _img(),
              _title(),
              _deadline(),
              _object(),
              _target(),
              _period(),
              _info(),
              _button()
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '신규 동아리원(디자인) 추가모집',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _img() {
    return SizedBox(
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
    );
  }

  Widget _deadline() {
    return const Column(
      children: [
        Row(
          children: [
            TitleBox(
              label: '모집마감일',
              fontSize: 20,
            )
          ],
        ),
        Row(
          children: [
            Text(
              '2023년 09월 30일',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }

  Widget _object() {
    return const Column(
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
    );
  }

  Widget _info() {
    return const Column(
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
    );
  }

  Widget _target() {
    return const Column(
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
    );
  }

  Widget _period() {
    return const Column(
      children: [
        Row(
          children: [TitleBox(label: '활동기간', fontSize: 20)],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  '2023년 3월 10일 - 2024년 1월 10일',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _button() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: SignButton(
          width: double.infinity,
          height: 45,
          child: Text(
            '지원하기',
            style: TextStyle(
                color: Color(0xffffffff), fontWeight: FontWeight.bold),
          ),
        ),
      );
}
