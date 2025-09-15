import 'package:kk_movie_app/data/movie/models/movie_country_model.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_country_entity.dart';

class MovieCountryMapper {
  MovieCountryMapper._();

  static List<MovieCountryEntity> toEntity(
    List<MovieCountryModel> movieCountryModels,
  ) {
    return movieCountryModels
        .map((e) => MovieCountryEntity(id: e.id, name: e.name, slug: e.slug))
        .toList();
  }
}
