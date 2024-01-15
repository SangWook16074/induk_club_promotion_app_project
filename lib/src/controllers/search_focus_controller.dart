import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/view/search_result.dart';

class SearchFocusController extends GetxController
    //컨트롤러 초기화를 위한 믹스인
    with
        GetSingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController get searchController => _controller;
  //탭 컨트롤러 getter

  void submitted(String value) {
    Get.off(
      () => const SearchResult(),
    );
  }
}
