import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
import 'package:induk_club_promotion_app_project/src/widget/custom_dialog.dart';
import 'package:induk_club_promotion_app_project/src/widget/profile_image.dart';

enum Page { HOME, MYPROMOTIONS, POST, MYPAGE }

class PageViewController extends GetxController {
  final RxInt _pageIndex = 0.obs;
  final List<String> _pageNames = [
    "홈",
    "게시판",
    "내가쓴글",
    "마이페이지",
  ];
  final List<Widget> _icon = [
    const Icon(Icons.home_outlined, color: Colors.white),
    const Icon(Icons.my_library_books_outlined, color: Colors.white),
    const Icon(Icons.contact_page_outlined, color: Colors.white),
    const ProfileImage(type: ProfileType.ICON)
  ];
  final List<Widget> _activeIcon = [
    const Icon(Icons.home, color: Colors.white),
    const Icon(Icons.my_library_books, color: Colors.white),
    const Icon(Icons.contact_page, color: Colors.white),
    const ProfileImage(type: ProfileType.ICONACTIVE)
  ];
  int get pageIndex => _pageIndex.value;
  int get length => _pageNames.length;
  List<String> get names => _pageNames;
  List<Widget> get icon => _icon;
  List<Widget> get activeIcon => _activeIcon;

  void changeIndex(int value) {
    if (_pageIndex.value != value) {
      print("current page : $value");
      _pageIndex(value);
    }
  }

  void moveToPage(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.MYPROMOTIONS:
      case Page.POST:
        changeIndex(value);
      case Page.MYPAGE:
        final user = Get.find<LoginController>().token;
        if (user != null) {
          Get.to(() => const MyPage());
        } else {
          showLoginDialog();
        }
    }
  }

  void showLoginDialog() => Get.dialog(CustomDialog(
        title: "로그인이 필요합니다 !",
        content: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "로그인 하시겠습니까?",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "내 정보를 확인하기 위해서는 반드시 로그인을 해야합니다.",
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
        confirm: () {
          Get.off(() => const LoginScreen());
        },
        cancel: () {
          Get.back();
        },
      ));
}
