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
      ],
    ));
  }

  Widget _clubInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const TitleBox(label: '동아리 정보', fontSize: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '수정',
                        style: Get.textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('동아리명', style: Get.textTheme.displayMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('A&I', style: Get.textTheme.displaySmall),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            Text('동아리 회장', style: Get.textTheme.displayMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '정보통신공학과 한상욱',
                          style: Get.textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:
                            Text('동아리 개설일', style: Get.textTheme.displayMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '2023년 1월 10일',
                          style: Get.textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('동아리 요약소개',
                            style: Get.textTheme.displayMedium),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '2022학년도에 진행한 스터디그룹 활동으로 처음 모여 모바일 앱 개발 공부 및 협업 프로젝트를 진행했으며, 플레이스토어와 앱스토어에 정식 출시까지 했습니다. 그리고 현재는 새로운 프로젝트를 준비하고 있습니다. ',
                          style: Get.textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget _myPromotions() {
  //   return Padding(
  //     padding: const EdgeInsets.all(40.0),
  //     child: BasicBox(
  //       width: double.infinity,
  //       height: 400,
  //       child: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Text(
  //                 '내가 쓴 글',
  //                 style: Get.textTheme.displayLarge,
  //               ),
  //             ],
  //           ),
  //           const Expanded(
  //             child: Center(
  //               child: Text(
  //                 '작성한 글이 없습니다',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _appBar() {
    return SliverAppBar(
      backgroundColor: Color(0xff713eff),
      title: Text('한상욱님! 환영합니다.', style: Get.textTheme.titleMedium),
      elevation: 0.0,
    );
  }

  Widget _myInfo() {
    return SliverToBoxAdapter(
      child: Container(
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
            // Positioned(
            //   top: 10,
            //   bottom: 10,
            //   left: 300,
            //   child: ProfileImage(
            //     length: 150,
            //     url:
            //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkWOsW52fToB1DAeOOFCC8MnOqV4djsYkYrw&usqp=CAU',
            //     type: constProfileType.MYPAGE,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
