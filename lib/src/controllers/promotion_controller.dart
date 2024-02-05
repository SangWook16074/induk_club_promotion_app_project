import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/app.dart';
import 'package:induk_club_promotion_app_project/src/constants/status.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

import '../data/model/promotion.dart';

class PromotionController extends GetxController {
  final Rx<List<Promotion>> _promotions = Rx<List<Promotion>>([]);
  final Rx<Status> _status = Rx<Status>(Status.LOADING);
  final PromotionRepository promotionRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  PromotionController({required this.promotionRepository});

  PromotionController get to => Get.find();
  List<Promotion> get promotions => _promotions.value;
  Status get status => _status.value;
  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  /// 홍보글 새로고침 메소드
  Future<void> fetchData() async {
    try {
      // 앱 상태 변경
      _status(Status.LOADING);
      final promotions = await promotionRepository.getPromotions();
      _promotions(promotions);
      _status(Status.LOADED);
    } on Exception {
      _status(Status.ERROR);
    }
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
