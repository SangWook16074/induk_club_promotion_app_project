import 'package:dio/dio.dart';

class MemberApi {
  final Dio dio;
  MemberApi({
    required this.dio,
  });

  Future<String> signUp(Map<String, dynamic> data) {
    try {
      return dio
          .post("http://localhost:8080/api/member/signup", data: data)
          .then((resp) {
        if (resp.statusCode == 200) {
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
