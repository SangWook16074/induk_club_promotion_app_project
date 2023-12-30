import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';
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
        final user = Get.find<LoginController>().user;
        if (user != null) {
          print("이동!");
          Get.to(() => const MyPage());
        } else {
          showLoginDialog();
          print("로그인이 필요합니다");
        }
    }
  }

  void showLoginDialog() => Get.dialog(Dialog(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: Center(child: Text("로그인이 필요합니다 !"))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: () {}, child: const Text("확인")),
                    TextButton(onPressed: () {}, child: const Text("취소")),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
