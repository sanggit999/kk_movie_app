import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getNewMovie();
  Future<Either<Failure, List<MovieEntity>>> getSeriesMovie();
  Future<Either<Failure, List<MovieEntity>>> getSingleMovie();
  Future<Either<Failure, List<MovieEntity>>> getCartoonMovie();
  Future<Either<Failure, List<MovieEntity>>> getViewAllMovies(
    MovieType? type, {
    int? page,
    String? sortType,
    String? sortLang,
  });
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(String slug);
}
