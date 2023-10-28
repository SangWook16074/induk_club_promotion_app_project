import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/auth_controller.dart';

class AuthBiding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}
