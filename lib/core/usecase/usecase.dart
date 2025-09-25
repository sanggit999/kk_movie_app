
import 'package:kk_movie_app/core/enums/movie_type.dart';

abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

class NoParams {
  const NoParams();
}

class GetViewAllParams {
  final MovieType movieType;
  final int? page;
  final String? sortType;
  final String? sortLang;

  GetViewAllParams({
    required this.movieType,
    this.page,
    this.sortType,
    this.sortLang,
  });
}
