// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchHistoryModel _$SearchHistoryModelFromJson(Map<String, dynamic> json) =>
    _SearchHistoryModel(
      id: json['id'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      keyword: json['keyword'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$SearchHistoryModelToJson(_SearchHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'keyword': instance.keyword,
      'created_at': instance.createdAt?.toIso8601String(),
    };
