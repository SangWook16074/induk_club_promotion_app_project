import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

import '../../constants/url.dart';

class PromotionApi {
  final Dio dio;
  PromotionApi({required this.dio});

  Future<List<Promotion>> getPromotions() {
    return dio.request(Url.getPromotionsUrl).then((resp) {
      if (resp.statusCode == 200) {
        final List<Promotion> promotions = [];
        for (var data in resp.data["data"]) {
          print(data);
          final Promotion promotion = Promotion.fromJson(data);
          promotions.add(promotion);
        }
        return promotions;
      } else {
        throw Exception("Fail to load promotion data...");
      }
    });
  }

  Future<Promotion?> postPromotion(Map<String, dynamic> data) async {
    final token = await const FlutterSecureStorage().read(key: "login");
    return dio
        .post(Url.postPromotionsUrl,
            data: data,
            options: Options(headers: {"Authorization": "Bearer $token"}))
        .then((resp) {
      if (resp.statusCode == 200) {
        final Promotion promotion = Promotion.fromJson(resp.data["data"]);
        return promotion;
      } else {
        return null;
      }
    });
  }
}
