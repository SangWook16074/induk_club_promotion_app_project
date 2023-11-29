import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_my_page.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';

class SideMenu extends GetView<PageController> {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: const Color(0xff713eff),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Text('LOGO', style: Get.textTheme.displayLarge),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(children: [
              const ProfileImage(
                  length: 80,
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkWOsW52fToB1DAeOOFCC8MnOqV4djsYkYrw&usqp=CAU',
                  type: ProfileType.MYPAGE),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  child: Text('로그아웃', style: Get.textTheme.labelMedium),
                  onTap: () {},
                ),
              ),
            ]),
            GestureDetector(
              child: ListTile(
                title: Text('마이페이지', style: Get.textTheme.labelMedium),
                onTap: () {
                  Get.to(const MyPage());
                },
              ),
            ),
            ListTile(
              title: Text(
                '내가쓴글',
                style: Get.textTheme.labelMedium,
              ),
            ),
            ListTile(
              title: Text(
                '글작성하기',
                style: Get.textTheme.labelMedium,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
