import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/promotion_repository.dart';

import '../data/model/promotion.dart';

class PromotionController extends GetxController {
  final Rx<List<Promotion>> _promotions = Rx<List<Promotion>>([]);
  final PromotionRepository promotionRepository;
  PromotionController({required this.promotionRepository});

  List<Promotion> get promotions => _promotions.value;
  @override
  void onReady() {
    super.onReady();
    _fetchData();
  }

  void _fetchData() async {
    promotionRepository
        .getPromotions()
        .then((data) => _promotions.value = data)
        .then((_) {
      print(_promotions.value);
    });
  }
}
