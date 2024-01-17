import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:induk_club_promotion_app_project/src/controllers/search_focus_controller.dart';

class SearchFocusBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchFocusController());
  }
}
