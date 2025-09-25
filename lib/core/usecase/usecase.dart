import 'package:kk_movie_app/core/enums/movie_type.dart';

abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

class NoParams {
  const NoParams();
}

class GetMovieParams {
  final MovieType? movieType;
  final String? slug;
  final int? page;
  final String? sortType;
  final String? sortLang;

  GetMovieParams({
    this.movieType,
    this.slug,
    this.page,
    this.sortType,
    this.sortLang,
  });
}
