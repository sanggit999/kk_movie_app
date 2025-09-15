import 'package:kk_movie_app/data/movie/models/modified_model.dart';
import 'package:kk_movie_app/domain/movie/entities/modified_entity.dart';

class ModifiedMapper {
  ModifiedMapper._();

  static ModifiedEntity toEntity(ModifiedModel modifiedModel) {
    return ModifiedEntity(time: modifiedModel.time);
  }
}
