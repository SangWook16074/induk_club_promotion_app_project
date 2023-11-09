import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/promotion_service.dart';

void main() {
  test("동아리 홍보글 가져오기", () {
    final promotionService = PromotionService(dio: Dio());

    promotionService
        .getPromotions()
        .then((_) => expect(promotionService.getPromotions(), []));
  });
}
