import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kk_movie_app/data/movie/models/episode_model.dart';

part 'episode_server_model.freezed.dart';
part 'episode_server_model.g.dart';

@freezed
abstract class EpisodeServerModel with _$EpisodeServerModel {
  const factory EpisodeServerModel({
    @Default('') @JsonKey(name: "server_name") String serverName,
    @Default([]) @JsonKey(name: "server_data") List<EpisodeModel> serverData,
  }) = _EpisodeServerModel;

  factory EpisodeServerModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeServerModelFromJson(json);
}
