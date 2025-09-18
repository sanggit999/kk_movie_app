import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';
import 'package:kk_movie_app/domain/movie/repositories/movie_repository.dart';

class GetMovieDetailUseCase
    implements UseCase<Either<Failure, MovieDetailEntity>, String> {
  @override
  Future<Either<Failure, MovieDetailEntity>> call(String params) {
    return getIt<MovieRepository>().getMovieDetail(params);
  }
}
