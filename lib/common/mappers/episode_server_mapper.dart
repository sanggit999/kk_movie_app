import 'package:kk_movie_app/common/mappers/episode_mapper.dart';
import 'package:kk_movie_app/data/movie/models/episode_server_model.dart';
import 'package:kk_movie_app/domain/movie/entities/episode_server_entity.dart';

class EpisodeServerMapper {
  EpisodeServerMapper._();

  static EpisodeServerEntity toEntity(EpisodeServerModel episodeServerModel) {
    return EpisodeServerEntity(
      serverName: episodeServerModel.serverName,
      serverData: episodeServerModel.serverData
          .map((e) => EpisodeMapper.toEntity(e))
          .toList(),
    );
  }
}
