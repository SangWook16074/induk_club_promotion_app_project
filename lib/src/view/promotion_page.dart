import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/constants/image_path.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/view/promotion_screen.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: (ResponsibleLayout.isMobile(context))
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(ImagePath.appiconpng),
                ),
              )
            : null,
        centerTitle: true,
        title: Text('게시판', style: Get.textTheme.displayLarge),
      ),
      body: _body(),
    );
  }

  Widget _body() => RefreshIndicator.adaptive(
        onRefresh: Get.find<PromotionController>().fetchData,
        child: SingleChildScrollView(
          child: GetX<PromotionController>(builder: (controller) {
            return Center(
              child: Column(
                  children:
                      List.generate(controller.promotions.length, (index) {
                final Promotion promotion = controller.promotions[index];
                return _buildItem(promotion: promotion);
              })),
            );
          }),
        ),
      );

  Widget _buildItem({required Promotion promotion}) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            Get.to(() => PromotionScreen(promotion: promotion));
          },
          child: PromotionItem(
            promotion: promotion,
            type: PromotionItemtype.LISTITEM,
          ),
        ));
  }
}
