import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';

class SearchFocus extends StatelessWidget {
  const SearchFocus({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff713eff),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: SearchTextField(
            controller: Get.find<AppController>().searchController,
          ),
          leading: GestureDetector(
            onTap: Get.back,
            child: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
      ),
    );
  }
}
