import 'package:kk_movie_app/domain/movie/entities/episode_entity.dart';

class EpisodeServerEntity {
  final String serverName;
  final List<EpisodeEntity> serverData;

  const EpisodeServerEntity({
    required this.serverName,
    required this.serverData,
  });
}
