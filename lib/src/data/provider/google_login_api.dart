import 'package:google_sign_in/google_sign_in.dart';
import 'package:induk_club_promotion_app_project/src/data/model/member.dart';

class GoogleLoginApi {
  final GoogleSignIn api;
  GoogleLoginApi({required this.api});

  Future<Member?> googleSignIn() async {
    try {
      return api.signIn().then((user) {
        if (user == null) {
          return null;
        } else {
          return Member.fromGoogle(user);
        }
      });
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut() => api.signOut();
}
