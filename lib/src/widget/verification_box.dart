// login email 인증 box
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/rive_image.dart';

class VerificaionBox extends GetView<LoginController> {
  const VerificaionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _body(),
        _button(),
      ],
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1.0, color: const Color(0xff713eff))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RiveImage(
              path: RiveImagePath.complete,
              width: 100,
              heigth: 150,
            ),
            const Text(
              "회원등록이 완료되었습니다 !",
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff713eff),
          ),
          onPressed: controller.moveToNext,
          child: const Text(
            '메인화면으로',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
