import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/common/mappers/movie_detail_mapper.dart';
import 'package:kk_movie_app/common/mappers/movie_mapper.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/data/movie/data_sources/movie_api_service.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/movie/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either<Failure, List<MovieEntity>>> getNewMovie() async {
    try {
      final result = await getIt<MovieApiService>().getNewMovie();

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSeriesMovie() async {
    try {
      final result = await getIt<MovieApiService>().getSeriesMovie();

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSingleMovie() async {
    try {
      final result = await getIt<MovieApiService>().getSingleMovie();

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getCartoonMovie() async {
    try {
      final result = await getIt<MovieApiService>().getCartoonMovie();

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getViewAllSeriesMovie(
    int page, {
    String? sortType,
    String? sortLang,
  }) async {
    try {
      final result = await getIt<MovieApiService>().getViewAllSeriesMovie(
        page,
        sortType: sortType,
        sortLang: sortLang,
      );

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getViewAllSingleMovie(
    int page, {
    String? sortType,
    String? sortLang,
  }) async {
    try {
      final result = await getIt<MovieApiService>().getViewAllSingleMovie(
        page,
        sortType: sortType,
        sortLang: sortLang,
      );

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getViewAllCartoonMovie(
    int page, {
    String? sortType,
    String? sortLang,
  }) async {
    try {
      final result = await getIt<MovieApiService>().getViewAllCartoonMovie(
        page,
        sortType: sortType,
        sortLang: sortLang,
      );

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
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
}
