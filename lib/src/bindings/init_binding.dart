import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/page_view_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/kakao_login_api.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(PageViewController(), permanent: true);
    Get.put(PromotionController(promotionRepository: PromotionRepository()),
        permanent: true);
    Get.put(LoginController(kakaoLoginApi: KakaoLoginApi()));
  }
}
