import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/resister_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/member_api.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';

class ResisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResisterController(
        repository: MemberRepository(api: MemberApi(dio: Dio()))));
  }
}
