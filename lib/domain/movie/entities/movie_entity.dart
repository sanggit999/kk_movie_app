import 'package:kk_movie_app/domain/movie/entities/imdb_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/modified_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_category_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_country_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/tmdb_entity.dart';

class MovieEntity {
  final TmdbEntity tmdb;
  final ImdbEntity imdb;
  final ModifiedEntity modified;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String type;
  final String posterUrl;
  final String thumbUrl;
  final bool subDocQuyen;
  final bool chieuRap;
  final String time;
  final String episodeCurrent;
  final String quality;
  final String lang;
  final int year;
  final List<MovieCategoryEntity> category;
  final List<MovieCountryEntity> country;

  MovieEntity({
    required this.tmdb,
    required this.imdb,
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.type,
    required this.posterUrl,
    required this.thumbUrl,
    required this.subDocQuyen,
    required this.chieuRap,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.year,
    required this.category,
    required this.country,
  });
}
