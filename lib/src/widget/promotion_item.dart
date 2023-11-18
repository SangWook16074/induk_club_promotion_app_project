import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';

class PromotionItem extends StatelessWidget {
  final Promotion promotion;
  final String date;
  final bool? showDday;
  const PromotionItem(
      {super.key,
      required this.date,
      this.showDday = false,
      required this.promotion});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 0.8,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xff1e1e1e))),
              child: Column(
                children: [
                  _image(),
                  _header(),
                  _discription(),
                ],
              ),
            ),
            Positioned(top: 20, right: 0, child: _dday())
          ],
        ),
      );

  Widget _header() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              promotion.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      );

  Widget _discription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          promotion.content,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _image() => AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle, color: Colors.grey),
        ),
      );

  Widget _dday() => Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(color: Color(0xff713eff)),
        child: Text(
          date,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
}
