import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobilePromotionView extends StatelessWidget {
  const MobilePromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff713eff),
        foregroundColor: Colors.white,
        title: const Text("Logo"),
        centerTitle: false,
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
                  _clubInfo(),
                  _roleInfo(),
                ],
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _join())
        ],
      ),
    );
  }

  Widget _title() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '신규 동아리원(디자인) 추가모집',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.grey,
              ),
            )
          ],
        ));
  }

  Widget _img() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              TitleBox(
                label: '모집기간',
                fontSize: 20,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '모집인원', fontSize: 20)],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

  Widget _clubInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '동아리소개', fontSize: 20)],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까비 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  Widget _target() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '우대학과', fontSize: 20)],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

  Widget _roleInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [TitleBox(label: '동아리소개', fontSize: 20)],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'UI/UX 디자인  프로젝트 화면 (UI)을 디자인하고, 이를 위한 미디어 파일 제작합니다.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  Widget _join() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      height: Get.size.height * 0.1,
      color: Colors.white.withOpacity(0.7),
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff713eff)),
              onPressed: () {},
              child: const Text(
                "지원하기",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ))),
    );
  }
}
