import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';

import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class DesktopMyPage extends StatelessWidget {
  const DesktopMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _appBar(),
        _myInfo(),
        _clubInfo(),
        _myPromotions(),
      ],
    ));
  }

  Widget _appBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xff713eff),
      title: Text('한상욱님! 환영합니다.', style: Get.textTheme.titleMedium),
      elevation: 0.0,
    );
  }

  Widget _myInfo() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: Get.size.height * 0.5,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    color: Get.theme.primaryColor,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 10,
              bottom: 10,
              left: 300,
              child: ProfileImage(
                length: 150,
                type: ProfileType.MYPAGE,
              ),
            ),
            const Positioned(
                top: 100,
                left: 450,
                bottom: 10,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                '마이페이지',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              '담딩자: 어쩌고',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _clubInfo() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 300.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleBox(
                  label: '동아리 소개',
                  fontSize: 20,
                ),
                Text(
                  '수정',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 300.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: const Color(0xffe0e0e0),
                  border: Border.all(color: const Color(0xffb5b5b5)),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Text(
                                '동아리명',
                                style: Get.theme.textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Text(
                                'A&I',
                                style: Get.theme.textTheme.displayMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Text(
                                '동아리개설일',
                                style: Get.theme.textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Text('2023년 1월 10일',
                                  style: Get.theme.textTheme.displayMedium)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Text(
                                '동아리분류',
                                style: Get.theme.textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Text(
                                '교내스터디',
                                style: Get.theme.textTheme.displayMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _myPromotions() {
    return const SliverToBoxAdapter(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 300.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleBox(label: '내가 쓴 글', fontSize: 20),
            ],
          ),
        ),
        Text('내가 쓴 글이 없습니다.')
      ]),
    );
  }
}
