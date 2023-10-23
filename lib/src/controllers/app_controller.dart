import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  final ScrollController _verticalController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  ScrollController get verticalController => _verticalController;
  TextEditingController get searchController => _searchController;

  int get pageIndex => _pageIndex.value;

  void moveToUp() {
    _verticalController.jumpTo(0.0);
  }

  void chageIndex(int value) {
    if (_pageIndex.value != value) {
      _pageIndex(value);
      update();
    }
  }

  void moveToMain() => chageIndex(0);

  void moveToPromotionPage() => chageIndex(1);

  void moveToMypage() => chageIndex(2);
}
