import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          _header(),
        ],
      );

  Widget _header() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                promotion.club,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              child: Text(
                promotion.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _image() => Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(4.0),
                  shape: BoxShape.rectangle,
                  color: Colors.grey),
            ),
          ),
          Positioned(top: 20, right: 0, child: _dday())
        ],
      );

  Widget _dday() => Opacity(
        opacity: (showDday!) ? 1.0 : 0.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: const BoxDecoration(color: Color(0xff713eff)),
          child: Text(
            date,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      );
}
