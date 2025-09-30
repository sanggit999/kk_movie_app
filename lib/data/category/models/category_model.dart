import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';
@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') String name,
    @Default('') String slug,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
