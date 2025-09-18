import 'package:kk_movie_app/common/mappers/episode_server_mapper.dart';
import 'package:kk_movie_app/common/mappers/movie_mapper.dart';
import 'package:kk_movie_app/data/movie/models/movie_detail_model.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';

class MovieDetailMapper {
  MovieDetailMapper._();

  static MovieDetailEntity toEntity(MovieDetailModel movieDetailModel) {
    return MovieDetailEntity(
      movie: MovieMapper.toEntity(movieDetailModel.movie),
      episodes: movieDetailModel.episodes
          .map((e) => EpisodeServerMapper.toEntity(e))
          .toList(),
    );
  }
}
