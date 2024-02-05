import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/app.dart';
import 'package:induk_club_promotion_app_project/src/controllers/status_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

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

  /// 홍보글 새로고침 메소드
  Future<void> fetchData() async {
    final promotions = await promotionRepository.getPromotions();
    _promotions(promotions);
  }

  // 홍보글 생성 메소드
  void createPromotion(Map<String, dynamic> data) async {
    final response = await promotionRepository.postPromotion(data);
    if (response != null) {
      _promotions.value.add((response));
      _promotions.refresh();
      Get.offAll(() => const App());
    }
  }
}
