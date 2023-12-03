import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
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
            Text('LOGO', style: Get.textTheme.displayLarge),
            const SizedBox(
              height: 50,
            ),
            Row(children: [
              const ProfileImage(length: 80, type: ProfileType.MYPAGE),
              GetX<LoginController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: (controller.user == null)
                      ? GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: Text('로그인', style: Get.textTheme.labelMedium),
                        )
                      : GestureDetector(
                          onTap: controller.signOut,
                          child: Text('로그아웃', style: Get.textTheme.labelMedium),
                        ),
                );
              }),
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
