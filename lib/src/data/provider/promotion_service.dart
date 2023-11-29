import 'package:dio/dio.dart';
import 'package:induk_club_promotion_app_project/src/contants/url.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

class PromotionService {
  final Dio dio;
  PromotionService({required this.dio});

  Future<List<Promotion>> getPromotions() {
    return dio.request(Url.getPromotionsUrl).then((resp) {
      if (resp.statusCode == 200) {
        final List<Promotion> promotions = [];
        for (Map<String, dynamic> data in resp.data) {
          final Promotion promotion = Promotion.fromJson(data);
          promotions.add(promotion);
        }
        return promotions;
      } else {
        throw Exception("Fail to load promotion data...");
      }
    });
  }
}
