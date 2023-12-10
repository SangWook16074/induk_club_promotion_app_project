import 'package:google_sign_in/google_sign_in.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';

class GoogleLoginApi {
  final GoogleSignIn api;
  GoogleLoginApi({required this.api});

  googleSignIn() async {
    try {
      final user = await api.signIn();
      print(user);
      return Member.fromGoogle(user!);
    } catch (error) {
      print(error);
    }
  }
}
