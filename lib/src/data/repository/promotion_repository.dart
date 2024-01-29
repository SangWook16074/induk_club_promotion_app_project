import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/promotion_api.dart';

/// 홍보글 레포지토리
class PromotionRepository {
  PromotionApi api;
  PromotionRepository({required this.api});

  Future<List<Promotion>> getPromotions() => api.getPromotions();

  Future<Promotion?> postPromotion(data) => api.postPromotion(data);
}
