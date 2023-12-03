import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginApi extends GetxService {
  Future<User?> kakaoSignIn() async {
    final api = UserApi.instance;
    try {
      return isKakaoTalkInstalled().then((isInstalled) async {
        (isInstalled)
            ? await api.loginWithKakaoTalk()
            : await api.loginWithKakaoAccount();

        return _getUserInfo().then((User user) {
          return user;
        });
      });
    } on PlatformException catch (e) {
      if (e.code == 'CANCELED') {
        return null;
      }
    } catch (e) {
      throw Exception("kakao Login Failed...");
    }
    return null;
  }

  signOut() => UserApi.instance.unlink();

  Future<User> _getUserInfo() {
    return UserApi.instance.me();
  }
}
