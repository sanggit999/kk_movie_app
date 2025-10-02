import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history_model.freezed.dart';
part 'search_history_model.g.dart';

@freezed
abstract class SearchHistoryModel with _$SearchHistoryModel {
  const factory SearchHistoryModel({
    @Default('') String id,
    @Default('') String uid,
    @Default('') String keyword,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _SearchHistoryModel;

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);
}
