// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieCategoryModel _$MovieCategoryModelFromJson(Map<String, dynamic> json) =>
    _MovieCategoryModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$MovieCategoryModelToJson(_MovieCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
