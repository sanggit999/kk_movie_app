import 'package:freezed_annotation/freezed_annotation.dart';
part 'imdb_model.freezed.dart';
part 'imdb_model.g.dart';

@freezed
abstract class ImdbModel with _$ImdbModel {
  const factory ImdbModel({@Default(0) int id}) = _ImdbModel;

  factory ImdbModel.fromJson(Map<String, dynamic> json) => _$ImdbModelFromJson(json);
}
