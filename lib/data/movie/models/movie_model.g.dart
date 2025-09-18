// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  tmdb: json['tmdb'] == null
      ? const TmdbModel()
      : TmdbModel.fromJson(json['tmdb'] as Map<String, dynamic>),
  id: json['_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  slug: json['slug'] as String? ?? '',
  originName: json['origin_name'] as String? ?? '',
  content: json['content'] as String? ?? '',
  type: json['type'] as String? ?? '',
  status: json['status'] as String? ?? '',
  posterUrl: json['poster_url'] as String? ?? '',
  thumbUrl: json['thumb_url'] as String? ?? '',
  time: json['time'] as String? ?? '',
  episodeCurrent: json['episode_current'] as String? ?? '',
  episodeTotal: json['episode_total'] as String? ?? '',
  quality: json['quality'] as String? ?? '',
  lang: json['lang'] as String? ?? '',
  year: (json['year'] as num?)?.toInt() ?? 0,
  view: (json['view'] as num?)?.toInt() ?? 0,
  actor:
      (json['actor'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  director:
      (json['director'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  category:
      (json['category'] as List<dynamic>?)
          ?.map((e) => MovieCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  country:
      (json['country'] as List<dynamic>?)
          ?.map((e) => MovieCountryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MovieModelToJson(_MovieModel instance) =>
    <String, dynamic>{
      'tmdb': instance.tmdb,
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'origin_name': instance.originName,
      'content': instance.content,
      'type': instance.type,
      'status': instance.status,
      'poster_url': instance.posterUrl,
      'thumb_url': instance.thumbUrl,
      'time': instance.time,
      'episode_current': instance.episodeCurrent,
      'episode_total': instance.episodeTotal,
      'quality': instance.quality,
      'lang': instance.lang,
      'year': instance.year,
      'view': instance.view,
      'actor': instance.actor,
      'director': instance.director,
      'category': instance.category,
      'country': instance.country,
    };
