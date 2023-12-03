import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion.freezed.dart';
part 'promotion.g.dart';

@freezed
class Promotion with _$Promotion {
  factory Promotion({
    required int id,
    required String title,
    required String content,
    required String userName,
    required String club,
    required DateTime createAt,
    required DateTime closeAt,
    required DateTime begin,
    required DateTime end,
    required int requiredPeople,
    required String contentOfActivity,
  }) = _Promotion;

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);
}
