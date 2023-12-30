import 'package:dio/dio.dart';
import 'package:induk_club_promotion_app_project/src/constants/url.dart';

class MemberApi {
  final Dio dio;
  MemberApi({
    required this.dio,
  });

  Future<String> signUp(Map<String, dynamic> data) {
    try {
      return dio.post(Url.signUpUrl, data: data).then((resp) {
        if (resp.statusCode == 201) {
          return resp.data;
        } else if (resp.statusCode == 400) {
          return resp.data;
        } else {
          return "";
        }
      });
    } catch (e) {
      throw Exception("Fail to request to server");
    }
  }
}
