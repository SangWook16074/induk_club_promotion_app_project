import 'package:get/get.dart';

class BottomNavController {
  final RxInt _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void changeIndex(int value) {
    _pageIndex(value);
  }
}
