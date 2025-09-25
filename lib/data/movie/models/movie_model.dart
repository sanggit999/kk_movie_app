import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kk_movie_app/data/movie/models/movie_category_model.dart';
import 'package:kk_movie_app/data/movie/models/movie_country_model.dart';
import 'package:kk_movie_app/data/movie/models/tmdb_model.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
abstract class MovieModel with _$MovieModel {
  const factory MovieModel({
    @Default(TmdbModel()) TmdbModel tmdb,
    @Default('') @JsonKey(name: "_id") String id,
    @Default('') String name,
    @Default('') String slug,
    @Default('') @JsonKey(name: "origin_name") String originName,
    @Default('') String content,
    @Default('') String type,
    @Default('') String status,
    @Default('') @JsonKey(name: "poster_url") String posterUrl,
    @Default('') @JsonKey(name: "thumb_url") String thumbUrl,
    @Default('') String time,
    @Default('') @JsonKey(name: "episode_current") String episodeCurrent,
    @Default('') @JsonKey(name: "episode_total") String episodeTotal,
    @Default('') String quality,
    @Default('') String lang,
    @Default(0) int year,
    @Default(0) int view,
    @Default([]) List<String> actor,
    @Default([]) List<String> director,
    @Default([]) List<MovieCategoryModel> category,
    @Default([]) List<MovieCountryModel> country,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
