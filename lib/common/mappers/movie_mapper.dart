import 'package:kk_movie_app/common/mappers/imdb_mapper.dart';
import 'package:kk_movie_app/common/mappers/modified_mapper.dart';
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
      imdb: ImdbMapper.toEntity(movieModel.imdb),
      modified: ModifiedMapper.toEntity(movieModel.modified),
      id: movieModel.id,
      name: movieModel.name,
      slug: movieModel.slug,
      originName: movieModel.originName,
      type: movieModel.type,
      posterUrl: movieModel.posterUrl,
      thumbUrl: movieModel.thumbUrl,
      subDocQuyen: movieModel.subDocQuyen,
      chieuRap: movieModel.chieuRap,
      time: movieModel.time,
      episodeCurrent: movieModel.episodeCurrent,
      quality: movieModel.quality,
      lang: movieModel.lang,
      year: movieModel.year,
      category: MovieCategoryMapper.toEntity(movieModel.category),
      country: MovieCountryMapper.toEntity(movieModel.country),
    );
  }
}
