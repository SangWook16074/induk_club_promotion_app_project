import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/view/search_result.dart';

class SearchFocusController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController get searchController => _controller;

  void submitted(String value) {
    Get.off(() => const SearchResult());
  }
}
