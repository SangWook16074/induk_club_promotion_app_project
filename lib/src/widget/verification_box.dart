// login email 인증 box
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';

class VerificaionBox extends GetView<LoginController> {
  const VerificaionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                _header(),
                _body(),
              ],
            ),
          ),
          Expanded(flex: 1, child: _button()),
        ],
      ),
    );
  }

  Widget _body() {
    return Flexible(
        child: Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: const Color(0xff713eff))),
    ));
  }

  Widget _button() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff713eff),
          ),
          onPressed: controller.moveToNext,
          child: const Text('다음')),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '이메일 인증',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
