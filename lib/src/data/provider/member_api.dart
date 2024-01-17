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

  Future<void> login(Map<String, dynamic> data) {
    try {
      return dio.post(Url.loginUrl, data: data).then((resp) {
        if (resp.statusCode == 200) {
          storage?.write(key: "login", value: resp.data["data"]["accessToken"]);
        } else {
          throw Exception("Fail to login");
        }
      });
    } catch (e) {
      throw Exception("Fail to access to server");
    }
  }
}
