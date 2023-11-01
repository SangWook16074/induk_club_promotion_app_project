import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';

class TermsCheckBox extends GetView<LoginController> {
  final void Function()? moveToNext;
  const TermsCheckBox({super.key, this.moveToNext});

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
                _terms(),
                _check(),
              ],
            ),
          ),
          Expanded(flex: 1, child: _button()),
        ],
      ),
    );
  }

  Widget _terms() {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1.0, color: const Color(0xff713eff))),
        child: SingleChildScrollView(child: Text('약관내용' * 10000)),
      ),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '약관동의',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
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
    return SizedBox(
        width: double.infinity,
        child: Obx(
          () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff713eff),
              ),
              onPressed: (controller.isAgree) ? controller.moveToNext : null,
              child: const Text('다음')),
        ));
  }
}
