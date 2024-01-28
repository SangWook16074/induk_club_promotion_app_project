import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:induk_club_promotion_app_project/src/controllers/image_picker_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_write_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/promotion_api.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

class PromotionWriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagePickerController(picker: ImagePicker()));
    Get.put(PromotionWriteController(
        promotionRepository:
            PromotionRepository(api: PromotionApi(dio: Dio()))));
  }
}
