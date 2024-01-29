import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

import '../../constants/url.dart';

/// 홍보글 API 엔드포인트
class PromotionApi {
  final Dio dio;
  PromotionApi({required this.dio});

  ///홍보글을 가져오기 GET 메소드
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

  /// 홍보글 작성하기 POST 메소드
  /// 토큰이 없는 사용자는 사용 불가능함
  /// 에러 발생시 NULL 반환
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
