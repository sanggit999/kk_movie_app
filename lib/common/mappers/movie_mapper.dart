import 'package:kk_movie_app/common/mappers/movie_category_mapper.dart';
import 'package:kk_movie_app/common/mappers/movie_country_mapper.dart';
import 'package:kk_movie_app/common/mappers/tmdb_mapper.dart';
import 'package:kk_movie_app/data/movie/models/movie_model.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

class MovieMapper {
  MovieMapper._();

  static MovieEntity toEntity(MovieModel movieModel) {
    return MovieEntity(
      tmdb: TmdbMapper.toEntity(movieModel.tmdb),
      id: movieModel.id,
      name: movieModel.name,
      slug: movieModel.slug,
      originName: movieModel.originName,
      content: movieModel.content,
      type: movieModel.type,
      status: movieModel.status,
      posterUrl: movieModel.posterUrl,
      thumbUrl: movieModel.thumbUrl,
      time: movieModel.time,
      episodeCurrent: movieModel.episodeCurrent,
      episodeTotal: movieModel.episodeTotal,
      quality: movieModel.quality,
      lang: movieModel.lang,
      year: movieModel.year,
      view: movieModel.view,
      actor: movieModel.actor,
      director: movieModel.director,
      category: MovieCategoryMapper.toEntity(movieModel.category),
      country: MovieCountryMapper.toEntity(movieModel.country),
    );
  }
}
