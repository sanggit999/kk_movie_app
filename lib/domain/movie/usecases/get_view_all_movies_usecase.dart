import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/movie/repositories/movie_repository.dart';

class GetViewAllMoviesUseCase
    implements UseCase<Either<Failure, List<MovieEntity>>, GetMovieParams> {
  @override
  Future<Either<Failure, List<MovieEntity>>> call(GetMovieParams params) {
    return getIt<MovieRepository>().getViewAllMovies(
      params.movieType,
      page: params.page,
      sortType: params.sortType,
      sortLang: params.sortLang,
    );
  }
}
