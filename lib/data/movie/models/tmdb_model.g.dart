// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TmdbModel _$TmdbModelFromJson(Map<String, dynamic> json) => _TmdbModel(
  type: json['type'] as String? ?? '',
  id: json['id'] as String? ?? '',
  season: (json['season'] as num?)?.toInt() ?? 0,
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TmdbModelToJson(_TmdbModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'season': instance.season,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
