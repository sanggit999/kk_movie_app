import 'package:freezed_annotation/freezed_annotation.dart';
part 'episode_model.freezed.dart';
part 'episode_model.g.dart';

@freezed
abstract class EpisodeModel with _$EpisodeModel {
  const factory EpisodeModel({
    @Default('') String name,
    @Default('') String slug,
    @Default('') String filename,
    @Default('') @JsonKey(name: "link_embed") String linkEmbed,
    @Default('') @JsonKey(name: "link_m3u8") String linkM3u8,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
}
