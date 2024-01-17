import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/app_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/search_focus_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';
import 'package:induk_club_promotion_app_project/src/widget/search_text_field.dart';

class SearchResult extends GetView<SearchFocusController> {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: Get.back,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Color(0xff713eff),
        ),
      ),
      centerTitle: true,
      title: SearchTextField(
        controller: controller.searchController,
      ),
    );
  }

  Widget _body() => SingleChildScrollView(
        child: GetX<PromotionController>(builder: (controller) {
          return Center(
            child: Column(
                children: List.generate(controller.promotions.length, (index) {
              final Promotion promotion = controller.promotions[index];
              return _buildItem(promotion: promotion);
            })),
          );
        }),
      );

  Widget _buildItem({required Promotion promotion}) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: PromotionItem(
          promotion: promotion,
          type: PromotionItemtype.LISTITEM,
        ));
  }
}
