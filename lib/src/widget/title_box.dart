import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TitleType { IMPORTANT, NORMAL }

class TitleBox extends StatelessWidget {
  final String label;
  final double fontSize;
  final TitleType? type;
  final double? height;
  final double? width;
  const TitleBox(
      {super.key,
      required this.label,
      required this.fontSize,
      this.type = TitleType.NORMAL,
      this.height = 50,
      this.width = 300});

  @override
  Widget build(BuildContext context) {
    switch (type!) {
      case TitleType.NORMAL:
        return _buildNormal();

      case TitleType.IMPORTANT:
        return _buildImportant();
    }
  }

  Widget _buildImportant() => Container(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: [
            _buildNormal(),
            Positioned(
              top: 2,
              left: 2,
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: const Color(0xff713eff)),
                    color: Colors.yellow,
                    shape: BoxShape.circle),
                child: const Text(
                  "!",
                  style: TextStyle(
                      color: Color(0xff713eff),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildNormal() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: Get.theme.primaryColor.withOpacity(0.8)),
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
}
