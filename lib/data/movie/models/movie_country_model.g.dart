// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieCountryModel _$MovieCountryModelFromJson(Map<String, dynamic> json) =>
    _MovieCountryModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$MovieCountryModelToJson(_MovieCountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
