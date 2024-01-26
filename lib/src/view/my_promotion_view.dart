import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/constants/image_path.dart';
import 'package:induk_club_promotion_app_project/src/controllers/login_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/member_controller.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:induk_club_promotion_app_project/src/responsible_layout.dart';
import 'package:induk_club_promotion_app_project/src/widget/promotion_item.dart';

class MyPromotionView extends StatelessWidget {
  const MyPromotionView({super.key});

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
        title: const Text(
          '내가쓴글',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return GetX<LoginController>(builder: (controller) {
      final token = controller.token;
      if (token == null) {
        return _noUser();
      } else {
        return _myPromotions();
      }
    });
  }

  Widget _myPromotions() => SingleChildScrollView(
        child: GetX<PromotionController>(builder: (controller) {
          final user = Get.find<MemberController>().member;
          if (user == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final myPromotions = controller.promotions
              .where(
                (promotion) => promotion.userId == user.id,
              )
              .toList();
          return Center(
            child: Column(
                children: List.generate(myPromotions.length, (index) {
              final Promotion promotion = myPromotions[index];
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

  Widget _noUser() {
    return const Center(
      child: Text(
        "로그인이 필요합니다 !",
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }
}
