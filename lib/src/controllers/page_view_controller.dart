import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/view/my_page_screen.dart';

enum Page { HOME, MYPAGE, MYPROMOTIONS, POST }

class PageViewController extends GetxController {
  final RxInt _pageIndex = 0.obs;
  final List<String> _pageNames = [
    "홈",
    "마이페이지",
    "내가 쓴 글",
    "게시판",
  ];
  int get pageIndex => _pageIndex.value;
  int get length => _pageNames.length;
  List<String> get names => _pageNames;

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
          print("로그인이 필요합니다");
        }
    }
  }
}
