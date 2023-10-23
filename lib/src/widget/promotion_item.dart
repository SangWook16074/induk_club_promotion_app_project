import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PromotionItemType { MOBILE, DESKTOP }

class PromotionItem extends StatelessWidget {
  final String? title;
  final String? discription;
  final String date;
  final PromotionItemType type;
  const PromotionItem(
      {super.key,
      this.title = '',
      required this.date,
      required this.type,
      required this.discription});

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      PromotionItemType.MOBILE => _mobileItem(),
      PromotionItemType.DESKTOP => _desktopItem()
    };
  }

  Widget _mobileItem() {
    return _basic(1.5);
  }

  Widget _desktopItem() {
    return _basic(2);
  }

  Widget _basic(double ratio) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: ratio,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(width: 1.0, color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  _discription(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        title!,
                        style: Get.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 10,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            date,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffffb938)),
          ),
        ),
      ],
    );
  }

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
}
