// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  tmdb: json['tmdb'] == null
      ? const TmdbModel()
      : TmdbModel.fromJson(json['tmdb'] as Map<String, dynamic>),
  imdb: json['imdb'] == null
      ? const ImdbModel()
      : ImdbModel.fromJson(json['imdb'] as Map<String, dynamic>),
  modified: json['modified'] == null
      ? const ModifiedModel()
      : ModifiedModel.fromJson(json['modified'] as Map<String, dynamic>),
  id: json['_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  slug: json['slug'] as String? ?? '',
  originName: json['origin_name'] as String? ?? '',
  type: json['type'] as String? ?? '',
  posterUrl: json['poster_url'] as String? ?? '',
  thumbUrl: json['thumb_url'] as String? ?? '',
  subDocQuyen: json['sub_docquyen'] as bool? ?? false,
  chieuRap: json['chieuRap'] as bool? ?? false,
  time: json['time'] as String? ?? '',
  episodeCurrent: json['episode_current'] as String? ?? '',
  quality: json['quality'] as String? ?? '',
  lang: json['lang'] as String? ?? '',
  year: (json['year'] as num?)?.toInt() ?? 0,
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
      'imdb': instance.imdb,
      'modified': instance.modified,
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'origin_name': instance.originName,
      'type': instance.type,
      'poster_url': instance.posterUrl,
      'thumb_url': instance.thumbUrl,
      'sub_docquyen': instance.subDocQuyen,
      'chieuRap': instance.chieuRap,
      'time': instance.time,
      'episode_current': instance.episodeCurrent,
      'quality': instance.quality,
      'lang': instance.lang,
      'year': instance.year,
      'category': instance.category,
      'country': instance.country,
    };
