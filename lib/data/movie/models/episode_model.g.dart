// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) =>
    _EpisodeModel(
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      linkEmbed: json['link_embed'] as String? ?? '',
      linkM3u8: json['link_m3u8'] as String? ?? '',
    );

Map<String, dynamic> _$EpisodeModelToJson(_EpisodeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'filename': instance.filename,
      'link_embed': instance.linkEmbed,
      'link_m3u8': instance.linkM3u8,
    };
