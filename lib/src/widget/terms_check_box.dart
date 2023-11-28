import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/sign_button.dart';

class TermsCheckBox extends GetView<LoginController> {
  const TermsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: Column(
            children: [
              _header(),
              _terms(),
              _check(),
            ],
          ),
        ),
        _button(),
      ],
    );
  }

  Widget _terms() {
    return Container(
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: const Color(0xff713eff))),
        child: SingleChildScrollView(child: Text('약관내용' * 10000)));
  }

  Widget _header() {
    return const Row(
      children: [
        Text(
          '약관동의',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _check() {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: (controller.isAgree) ? true : false,
            onChanged: controller.agree,
            checkColor: Colors.white,
            side: const BorderSide(color: Color(0xff713eff), width: 2.0),
          ),
          const Text(
            '동의',
            style: TextStyle(color: Colors.black),
          ),
          Checkbox(
            value: (controller.isAgree) ? false : true,
            onChanged: controller.disagree,
            side: const BorderSide(color: Color(0xff713eff), width: 2.0),
          ),
          const Text(
            '동의하지 않음',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Obx(
          () => SignButton(
              width: 150,
              height: 40,
              onPressed: (controller.isAgree) ? controller.moveToNext : null,
              child: const Text(
                '다음',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        )
      ],
    );
  }
}
