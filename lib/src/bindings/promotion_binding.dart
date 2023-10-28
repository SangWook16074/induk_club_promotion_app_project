import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';

class PromotionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PromotionController());
  }
}
