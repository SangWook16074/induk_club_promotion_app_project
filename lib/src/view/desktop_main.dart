import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/bindings/auth_binding.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/login.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';

class DesktopMain extends GetView<AppController> {
  const DesktopMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      controller: controller.verticalController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _top(),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }

  Widget _top() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
        SearchTextField(
            controller: controller.searchController,
            type: SearchBarType.DESKTOP),
        TextButton(
          onPressed: () {
            Get.to(() => const Login(), binding: AuthBiding());
          },
          child: const Text("로그인", style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }
}
