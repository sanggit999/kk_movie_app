import 'package:kk_movie_app/data/movie/models/movie_category_model.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_category_entity.dart';

class MovieCategoryMapper {
  MovieCategoryMapper._();

  static List<MovieCategoryEntity> toEntity(
    List<MovieCategoryModel> movieCategoryModels,
  ) {
    return movieCategoryModels
        .map((e) => MovieCategoryEntity(id: e.id, name: e.name, slug: e.slug))
        .toList();
  }
}
