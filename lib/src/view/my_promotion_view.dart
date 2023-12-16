import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/controllers/promotion_controller.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

class MyPromotionView extends StatefulWidget {
  const MyPromotionView({super.key});

  @override
  State<MyPromotionView> createState() => _MyPromotionViewState();
}

class _MyPromotionViewState extends State<MyPromotionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
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
      child: SizedBox(
        width: 700,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      // color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(
                              promotion.club,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              promotion.title,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              promotion.closeAt.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 25,
              thickness: 1,
              indent: 2,
              endIndent: 2,
              color: Color.fromARGB(255, 237, 237, 237),
            )
          ],
        ),
      ),
    );
  }
}
