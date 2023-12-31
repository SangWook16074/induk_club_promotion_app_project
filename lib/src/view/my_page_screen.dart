import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff713eff),
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
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "로그아웃",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget _myInfo() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Stack(children: [
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (ResponsibleLayout.isMobile(context) ? 16 : 200)),
            child: const SizedBox(
              height: 500,
              child: ProfileImage(
                length: 150,
                type: ProfileType.MYPAGE,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _clubInfo() => SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: ResponsibleLayout.isMobile(context) ? 16 : 200),
                child: const Row(
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
                padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: ResponsibleLayout.isMobile(context) ? 16 : 200),
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
                                    style: Get.theme.textTheme.bodyMedium,
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
                                    style: Get.theme.textTheme.bodyMedium,
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
                                    style: Get.theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  Text('2023년 1월 10일',
                                      style: Get.theme.textTheme.bodyMedium)
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
                                    style: Get.theme.textTheme.bodyMedium,
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
                                    style: Get.theme.textTheme.bodyMedium,
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
        ),
      );

  Widget _myPromotions() => SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: ResponsibleLayout.isMobile(context) ? 16 : 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleBox(label: '내가 쓴 글', fontSize: 20),
                    Icon(
                      Icons.edit,
                      color: Get.theme.primaryColor,
                    )
                  ],
                ),
              ),
              ...List.generate(
                20,
                (index) => _items(),
              )
              // _noItem(),
            ],
          ),
        ),
      );

  Widget _items() => Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: ResponsibleLayout.isMobile(context) ? 16 : 200),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xffe0e0e0),
            border: Border.all(color: const Color(0xffb5b5b5)),
          ),
          child: Text(
            "A&I 신규 동아리원 모집합니다.",
            style: Get.theme.textTheme.bodyMedium,
          ),
        ),
      );
  Widget _noItem() => Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 100,
        child: const Text("작성한 글이 없습니다"),
      );
}
