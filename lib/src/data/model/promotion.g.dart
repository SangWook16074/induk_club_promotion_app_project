// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotionImpl _$$PromotionImplFromJson(Map<String, dynamic> json) =>
    _$PromotionImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      userName: json['userName'] as String,
      club: json['club'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      closeAt: DateTime.parse(json['closeAt'] as String),
      begin: DateTime.parse(json['begin'] as String),
      end: DateTime.parse(json['end'] as String),
      requiredPeople: json['requiredPeople'] as int,
      contentOfActivity: json['contentOfActivity'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PromotionImplToJson(_$PromotionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'userName': instance.userName,
      'club': instance.club,
      'createAt': instance.createAt.toIso8601String(),
      'closeAt': instance.closeAt.toIso8601String(),
      'begin': instance.begin.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'requiredPeople': instance.requiredPeople,
      'contentOfActivity': instance.contentOfActivity,
      'images': instance.images,
    };
