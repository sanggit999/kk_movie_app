import 'package:kk_movie_app/domain/movie/entities/movie_category_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_country_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/tmdb_entity.dart';

class MovieEntity {
  final TmdbEntity tmdb;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String? content;
  final String? type;
  final String? status;
  final String posterUrl;
  final String thumbUrl;
  final String? time;
  final String? episodeCurrent;
  final String? episodeTotal;
  final String? quality;
  final String? lang;
  final int? year;
  final int? view;
  final List<String>? actor;
  final List<String>? director;
  final List<MovieCategoryEntity>? category;
  final List<MovieCountryEntity>? country;

  MovieEntity({
    required this.tmdb,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    this.content,
    this.type,
    this.status,
    required this.posterUrl,
    required this.thumbUrl,
    this.time,
    this.episodeCurrent,
    this.episodeTotal,
    this.quality,
    this.lang,
    this.year,
    this.view,
    this.actor,
    this.director,
    this.category,
    this.country,
  });
}
