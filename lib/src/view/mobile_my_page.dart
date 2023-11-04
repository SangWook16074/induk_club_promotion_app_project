import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';
import 'package:induk_club_promotion_app_project/src/widget/title_box.dart';

class MobileMyPage extends StatelessWidget {
  const MobileMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff713eff),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              elevation: 0.0,
              title: const Text("한상욱님! 환영합니다."),
              titleTextStyle: Theme.of(context).textTheme.displaySmall,
              centerTitle: false,
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "로그아웃",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                )
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0.0,
                  pinned: false,
                  floating: false,
                  title: const Text("MY PAGE"),
                  expandedHeight: MediaQuery.of(context).size.height * 0.25,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 4.0,
                    title: ProfileImage(
                        type: ProfileType.MYPAGE,
                        length: MediaQuery.of(context).size.height * 0.05,
                        url:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU"),
                    collapseMode: CollapseMode.parallax,
                    background: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _clubInfo(),
                _myPromotions(),
              ],
            )

            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       _clubInfo(),
            //       _myPromotions(),
            //     ],
            //   ),
            // )

            ),
      ),
    );
  }

  Widget _clubInfo() => SliverToBoxAdapter(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
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
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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

  Widget _myPromotions() => SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
      );

  Widget _items() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
            style: Get.theme.textTheme.displayMedium,
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
