import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/page_view_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';

class SideMenu extends GetView<PageViewController> {
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
            ...List.generate(controller.length, (index) {
              final title = controller.names[index];
              return Obx(
                () => GestureDetector(
                  child: ListTile(
                    title: Text(title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: (controller.pageIndex == index)
                              ? FontWeight.w600
                              : FontWeight.w500,
                        )),
                    onTap: () {
                      controller.moveToPage(index);
                    },
                  ),
                ),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
