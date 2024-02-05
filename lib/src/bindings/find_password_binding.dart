import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/find_password_controller.dart';

class FindPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FindPasswordController());
  }
}
