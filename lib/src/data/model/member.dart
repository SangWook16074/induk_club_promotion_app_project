import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class Member {
  final String? nickName;
  final String? profile;

  Member({
    required this.nickName,
    this.profile,
  });

  factory Member.fromKakao(User user) {
    return Member(
        nickName: user.properties?["nickname"],
        profile: user.properties?["profile_image"]);
  }

  factory Member.fromGoogle(GoogleSignInAccount user) {
    return Member(nickName: user.displayName, profile: user.photoUrl);
  }
}
