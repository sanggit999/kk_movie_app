import 'package:kk_movie_app/domain/movie/entities/episode_server_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

class MovieDetailEntity {
  final MovieEntity movie;
  final List<EpisodeServerEntity>? episodes;

  const MovieDetailEntity({required this.movie,  this.episodes});
}
