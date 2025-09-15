import 'package:freezed_annotation/freezed_annotation.dart';

part 'modified_model.freezed.dart';
part 'modified_model.g.dart';

@freezed
abstract class ModifiedModel with _$ModifiedModel {
  const factory ModifiedModel({@Default('') String time}) = _ModifiedModel;

  factory ModifiedModel.fromJson(Map<String, dynamic> json) =>
      _$ModifiedModelFromJson(json);
}
