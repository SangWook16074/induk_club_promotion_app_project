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
      author: json['author'] as String,
      createAt: json['createAt'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
      numPeople: json['numPeople'] as int,
      contentOfActivity: json['contentOfActivity'] as String,
    );

Map<String, dynamic> _$$PromotionImplToJson(_$PromotionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'author': instance.author,
      'createAt': instance.createAt,
      'begin': instance.begin,
      'end': instance.end,
      'numPeople': instance.numPeople,
      'contentOfActivity': instance.contentOfActivity,
    };
