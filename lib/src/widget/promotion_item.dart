import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromotionItem extends StatelessWidget {
  final String? title;
  final String? discription;
  final String date;
  final bool? showDday;
  const PromotionItem(
      {super.key,
      this.title = '',
      required this.date,
      required this.discription,
      this.showDday = false});

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
                  // _discription(),
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
              title!,
              style: Get.textTheme.displayMedium,
            ),
          )
        ],
      );

  Widget _discription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          discription!,
          style: Get.textTheme.headlineMedium,
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
