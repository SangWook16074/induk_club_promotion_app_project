// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotionImpl _$$PromotionImplFromJson(Map<String, dynamic> json) =>
    _$PromotionImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      userName: json['userName'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      closeAt: DateTime.parse(json['closeAt'] as String),
      begin: DateTime.parse(json['begin'] as String),
      end: DateTime.parse(json['end'] as String),
      requiredPeople: json['requiredPeople'] as int,
      contentOfActivity: json['contentOfActivity'] as String,
    );

Map<String, dynamic> _$$PromotionImplToJson(_$PromotionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'userName': instance.userName,
      'createAt': instance.createAt.toIso8601String(),
      'closeAt': instance.closeAt.toIso8601String(),
      'begin': instance.begin.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'requiredPeople': instance.requiredPeople,
      'contentOfActivity': instance.contentOfActivity,
    };
