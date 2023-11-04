import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/bottom_nav_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(BottomNavController(), permanent: true);
    Get.put(PromotionController(), permanent: true);
  }
}
