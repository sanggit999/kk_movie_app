import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_country_model.freezed.dart';
part 'movie_country_model.g.dart';

@freezed
abstract class MovieCountryModel with _$MovieCountryModel {
  const factory MovieCountryModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String slug,
  }) = _MovieCountryModel;

  factory MovieCountryModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCountryModelFromJson(json);
}
