// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    _MovieDetailModel(
      movie: json['movie'] == null
          ? const MovieModel()
          : MovieModel.fromJson(json['movie'] as Map<String, dynamic>),
      episodes:
          (json['episodes'] as List<dynamic>?)
              ?.map(
                (e) => EpisodeServerModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MovieDetailModelToJson(_MovieDetailModel instance) =>
    <String, dynamic>{'movie': instance.movie, 'episodes': instance.episodes};
