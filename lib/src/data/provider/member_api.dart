import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:induk_club_promotion_app_project/src/constants/url.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';

/// 회원정보 API 엔드포인트
class MemberApi {
  final Dio dio;
  final storage = const FlutterSecureStorage();
  MemberApi({
    required this.dio,
  });

  /// 회원가입 메소드
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

  /// 로그인 메소드
  Future<String?> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(Url.loginUrl, data: data);
      if (response.statusCode == 200) {
        final token = response.data["data"]["accessToken"];
        return token;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Fail to access to server");
    }
  }

  /// 내 정보 가져오기 메소드
  Future<Member?> searchMyInfo(String token) async {
    final response = await dio.get("http://localhost:8080/api/member/info",
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.statusCode == 200) {
      return Member.fromJson(response.data["data"]);
    } else {
      return null;
    }
  }

  Future<String?> saveClubInfo(Map<String, dynamic> data) async {
    final token = await storage.read(key: "login");
    final response = await dio.put("http://localhost:8080/api/member/club",
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == 200) {
      return response.data["data"].toString();
    } else {
      return null;
    }
  }

  Future<String> resetPassword(Map<String, dynamic> data) async {
    final token = await storage.read(key: "login");
    final response = await dio.post(
        "http://localhost:8080/api/member/reset-password",
        data: data,
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      return response.data["message"];
    }
  }
}
