import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Member {
  final String? nickName;
  final String? profile;
  final String? email;
  final String? password;

  Member({
    required this.nickName,
    this.profile,
    this.email,
    this.password,
  });

  factory Member.fromKakao(User user) {
    return Member(
        nickName: user.properties?["nickname"],
        profile: user.properties?["profile_image"]);
  }

  factory Member.fromGoogle(GoogleSignInAccount user) {
    return Member(nickName: user.displayName, profile: user.photoUrl);
  }

  factory Member.fromApple(AuthorizationCredentialAppleID user) {
    return Member(nickName: user.userIdentifier);
  }

  Map<String, dynamic> toJson(Member member) => {
        "name": member.nickName,
        "email": member.email,
        "password": member.password,
      };
}
