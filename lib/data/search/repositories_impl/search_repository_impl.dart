import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/common/mappers/movie_mapper.dart';
import 'package:kk_movie_app/common/mappers/search_mapper.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/data/search/data_sources/search_api_service.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';
import 'package:kk_movie_app/domain/search/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovie(String keyword) async {
    try {
      final result = await getIt<SearchApiService>().searchMovie(keyword);

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SearchHistoryEntity>>> getSearchHistory(
    String uid,
  ) async {
    try {
      final result = await getIt<SearchApiService>().getSearchHistory(uid);
      final data = SearchMapper.toEntity(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<void> saveSearchHistory(
    SearchHistoryEntity searchHistoryEntity,
  ) async {
    final model = SearchMapper.toModel(searchHistoryEntity);
    await getIt<SearchApiService>().saveSearchHistory(model);
  }

  @override
  Future<void> deleteSearchHistoryItem(String uid, String keyword) async {
    await getIt<SearchApiService>().deleteSearchHistoryItem(uid, keyword);
  }

  @override
  Future<void> clearSearchHistory(String uid) async {
    await getIt<SearchApiService>().clearSearchHistory(uid);
  }
}
