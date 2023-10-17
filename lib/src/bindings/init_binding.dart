import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
