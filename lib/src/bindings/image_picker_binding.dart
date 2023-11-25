import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:induk_club_promotion_app_project/src/controllers/image_picker_controller.dart';

class ImagePickerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagePickerController(picker: ImagePicker()));
  }
}
