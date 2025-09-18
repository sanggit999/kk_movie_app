import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kk_movie_app/data/movie/models/episode_server_model.dart';
import 'package:kk_movie_app/data/movie/models/movie_model.dart';

part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

@freezed
abstract class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    @Default(MovieModel()) MovieModel movie,
    @Default([]) List<EpisodeServerModel> episodes,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}
