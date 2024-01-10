import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:induk_club_promotion_app_project/src/data/model/promotion.dart';
import 'package:intl/intl.dart';

enum DateType { DateCloseAt, DateBeginEnd }

class DateFormatWidget extends StatelessWidget {
  final Promotion promotion;
  final double fontSize;
  final DateType type;
  const DateFormatWidget(
      {super.key,
      required this.promotion,
      this.type = DateType.DateCloseAt,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DateType.DateCloseAt:
        return _buildDateCloseAt();
      case DateType.DateBeginEnd:
        return _buildDateBeginEnd();
    }
  }

  Widget _buildDateCloseAt() {
    return Text(
      DateFormat.yMd().format(promotion.closeAt),
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildDateBeginEnd() {
    return Text(
      '${DateFormat.yMd().format(promotion.begin)}\n${DateFormat.yMd().format(promotion.end)}',
      style: Get.textTheme.bodyMedium,
    );
  }
}
