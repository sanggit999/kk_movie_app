import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/common/mappers/movie_detail_mapper.dart';
import 'package:kk_movie_app/common/mappers/movie_mapper.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/data/movie/data_sources/movie_api_service.dart';
import 'package:kk_movie_app/data/movie/models/movie_model.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';
import 'package:kk_movie_app/domain/movie/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either<Failure, List<MovieEntity>>> getNewMovie() {
    return _getMovies(() => getIt<MovieApiService>().getNewMovie());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSeriesMovie() {
    return _getMovies(() => getIt<MovieApiService>().getSeriesMovie());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSingleMovie() {
    return _getMovies(() => getIt<MovieApiService>().getSingleMovie());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getCartoonMovie() {
    return _getMovies(() => getIt<MovieApiService>().getCartoonMovie());
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getViewAllMovies(
    MovieType? type, {
    int? page,
    String? sortType,
    String? sortLang,
  }) async {
    try {
      final result = await getIt<MovieApiService>().getViewAllMovies(
        type,
        page: page,
        sortType: sortType,
        sortLang: sortLang,
      );

      return Right(result.map((model) => MovieMapper.toEntity(model)).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(String slug) async {
    try {
      final result = await getIt<MovieApiService>().getMovieDetail(slug);

      return Right(MovieDetailMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<MovieEntity>>> _getMovies(
    Future<List<MovieModel>> Function() fn,
  ) async {
    try {
      final result = await fn();
      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
