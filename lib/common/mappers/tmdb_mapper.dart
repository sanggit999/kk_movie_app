import 'package:kk_movie_app/data/movie/models/tmdb_model.dart';
import 'package:kk_movie_app/domain/movie/entities/tmdb_entity.dart';

class TmdbMapper {
  TmdbMapper._();

  static TmdbEntity toEntity(TmdbModel tmdbModel) {
    return TmdbEntity(
      type: tmdbModel.type,
      id: tmdbModel.id,
      season: tmdbModel.season,
      voteAverage: tmdbModel.voteAverage,
      voteCount: tmdbModel.voteCount,
    );
  }
}
