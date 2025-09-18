import 'package:kk_movie_app/data/movie/models/episode_model.dart';
import 'package:kk_movie_app/domain/movie/entities/episode_entity.dart';

class EpisodeMapper {
  EpisodeMapper._();

  static EpisodeEntity toEntity(EpisodeModel episodeModel) {
    return EpisodeEntity(
      name: episodeModel.name,
      slug: episodeModel.slug,
      filename: episodeModel.filename,
      linkEmbed: episodeModel.linkEmbed,
      linkM3u8: episodeModel.linkM3u8,
    );
  }
}
