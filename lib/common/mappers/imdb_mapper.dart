import 'package:kk_movie_app/data/movie/models/imdb_model.dart';
import 'package:kk_movie_app/domain/movie/entities/imdb_entity.dart';

class ImdbMapper {
  ImdbMapper._();

  static ImdbEntity toEntity(ImdbModel imdbModel){
    return ImdbEntity(id: imdbModel.id);
  }
}