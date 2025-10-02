import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/search/repositories/search_repository.dart';

class SearchMovieUseCase
    implements UseCase<Either<Failure, List<MovieEntity>>, String> {
  @override
  Future<Either<Failure, List<MovieEntity>>> call(String params) {
    return getIt<SearchRepository>().searchMovie(params);
  }
}
