import 'package:freezed_annotation/freezed_annotation.dart';
part 'tmdb_model.freezed.dart';
part 'tmdb_model.g.dart';

@freezed
abstract class TmdbModel with _$TmdbModel{
  const factory TmdbModel({
    @Default('') String type,
    @Default('') String id,
    @Default(0) int season,
    @Default(0.0) @JsonKey(name: "vote_average") double voteAverage,
    @Default(0) @JsonKey(name: "vote_count") int voteCount,
  }) = _TmdbModel;

  factory TmdbModel.fromJson(Map<String, dynamic> json) => _$TmdbModelFromJson(json);
}
