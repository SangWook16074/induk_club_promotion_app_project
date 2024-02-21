import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/view/login_screen.dart';
import 'package:rive/rive.dart';

class ResisterComplete extends StatelessWidget {
  const ResisterComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                width: 200,
                height: 200,
                child: RiveAnimation.asset("assets/rives/check_icon.riv")),
            const Text("회원가입이 완료되었습니다 !"),
            const Text("이제 로그인 후 서비스를 이용해보세요!"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Get.off(() => const LoginScreen());
                  },
                  child: const Text(
                    "로그인하러가기",
                    style: TextStyle(fontSize: 15),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
