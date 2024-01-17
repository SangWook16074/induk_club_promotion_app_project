import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:induk_club_promotion_app_project/src/constants/url.dart';

class MemberApi {
  final Dio dio;
  final FlutterSecureStorage? storage;
  MemberApi({
    required this.dio,
    this.storage,
  });

  Future<String> signUp(Map<String, dynamic> data) {
    try {
      return dio.post(Url.signUpUrl, data: data).then((resp) {
        if (resp.statusCode == 200) {
          return resp.data["message"];
        } else if (resp.statusCode == 400) {
          print(resp.data);
          return resp.data["data"]["email"];
        } else {
          return resp.data["data"]["email"];
        }
      });
    } catch (e) {
      throw Exception("Fail to request to server");
    }
  }

  Future<String?> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(Url.loginUrl, data: data);
      if (response.statusCode == 200) {
        final token = response.data["data"]["accessToken"];
        return token;
      } else {
        final error = response.data["data"]["로그인 실패"];
        return null;
      }
    } catch (e) {
      throw Exception("Fail to access to server");
    }
  }
}
