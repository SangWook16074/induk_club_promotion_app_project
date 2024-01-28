import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/app.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';
import 'package:induk_club_promotion_app_project/src/view/home_screen.dart';

import '../data/model/promotion.dart';

class PromotionController extends GetxController {
  final Rx<List<Promotion>> _promotions = Rx<List<Promotion>>([]);
  final PromotionRepository promotionRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  PromotionController({required this.promotionRepository});

  List<Promotion> get promotions => _promotions.value;
  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  Future<void> fetchData() async {
    promotionRepository
        .getPromotions()
        .then((data) => _promotions.value = data)
        .then((_) {
      print(_promotions.value);
    });
  }

  void createPromotion(Map<String, dynamic> data) async {
    final response = await promotionRepository.postPromotion(data);
    print(response);
    if (response != null) {
      _promotions.value.add((response));
      _promotions.refresh();
      Get.offAll(() => const App());
    }
  }
}
