import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:induk_club_promotion_app_project/src/data/provider/promotion_api.dart';

void main() {
  test("동아리 홍보글 가져오기", () {
    final api = PromotionApi(dio: Dio());

    api.getPromotions().then((_) => expect(api.getPromotions(), []));
  });
}
