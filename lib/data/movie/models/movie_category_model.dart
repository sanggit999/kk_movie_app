import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_category_model.freezed.dart';
part 'movie_category_model.g.dart';

@freezed
abstract class MovieCategoryModel with _$MovieCategoryModel {
  const factory MovieCategoryModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String slug,
  }) = _MovieCategoryModel;

  factory MovieCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCategoryModelFromJson(json);
}
