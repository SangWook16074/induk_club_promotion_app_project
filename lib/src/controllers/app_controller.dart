import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/desktop_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/mobile_promotion_view.dart';
import 'package:induk_club_promotion_app_project/src/view/tablet_promotion_view.dart';

class AppController extends GetxController {
  final RxInt _pageIndex = 0.obs;
  final RxInt _carouselIndex = 0.obs;

  final ScrollController _verticalController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  ScrollController get verticalController => _verticalController;
  TextEditingController get searchController => _searchController;

  int get pageIndex => _pageIndex.value;

  int get carouselIndex => _carouselIndex.value;

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

  changeIndex(int index, CarouselPageChangedReason reason) {
    _carouselIndex(index);
  }

  void moveToLogin() {}

  void moveToPromotionView() {
    Get.to(
      () => const ResponsibleLayout(
        mobile: MobilePromotionView(),
        tablet: TabletPromotionView(),
        desktop: DesktopPromotionView(),
      ),
    );
  }
}
