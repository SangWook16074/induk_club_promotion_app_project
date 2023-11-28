import 'package:dio/dio.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

import '../../constants/url.dart';

class PromotionApi {
  final Dio dio;
  PromotionApi({required this.dio});

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

  Future<Promotion> postPromotion(Map<String, dynamic> data) {
    return dio.post(Url.postPromotionsUrl, data: data).then((resp) {
      if (resp.statusCode == 200) {
        final Promotion promotion = Promotion.fromJson(resp.data);
        return promotion;
      } else {
        throw Exception("Fail to create promotion data...");
      }
    });
  }
}
