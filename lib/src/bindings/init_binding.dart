import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/page_view_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/google_login_api.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/kakao_login_api.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/member_api.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/promotion_api.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(PageViewController(), permanent: true);
    Get.put(
        PromotionController(
            promotionRepository:
                PromotionRepository(api: PromotionApi(dio: Dio()))),
        permanent: true);
    Get.put(LoginController(
        kakaoLoginApi: KakaoLoginApi(),
        googleLoginApi: GoogleLoginApi(api: GoogleSignIn()),
        memberRepository: MemberRepository(api: MemberApi(dio: Dio()))));
  }
}
