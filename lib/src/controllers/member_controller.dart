import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';
import 'package:induk_club_promotion_app_project/src/data/repository/member_repository.dart';

class MemberController extends GetxController {
  final Rxn<Member> _member = Rxn<Member>();
  final MemberRepository memberRepository;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  MemberController({required this.memberRepository});

  Member? get member => _member.value;

  /// 사용자 정보 조회
  void fetchMemberData() async {
    final token = Get.find<LoginController>().token;
    if (token == null) return;
    final member = await memberRepository.searchMyInfo(token);
    if (member != null) {
      _member(member);
    }
  }
}
