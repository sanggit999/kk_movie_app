import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/movie/repositories/movie_repository.dart';

class GetNewMovieUseCase
    implements UseCase<Either<Failure, List<MovieEntity>>, NoParams> {
  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) {
    return getIt<MovieRepository>().getNewMovie();
  }
}
