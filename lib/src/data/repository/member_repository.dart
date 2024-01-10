import 'package:induk_club_promotion_app_project/src/data/provider/member_api.dart';

class MemberRepository {
  final MemberApi api;
  MemberRepository({required this.api});

  Future<String> signUp(Map<String, dynamic> data) => api.signUp(data);

  Future<String> signIn(Map<String, dynamic> data) => api.login(data);
}
