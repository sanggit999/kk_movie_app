import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<MovieEntity>>> searchMovie(String keyword);

  Future<Either<Failure, List<SearchHistoryEntity>>> getSearchHistory(
    String uid,
  );

  Future<void> saveSearchHistory(SearchHistoryEntity searchHistoryModel);

  Future<void> deleteSearchHistoryItem(String uid, String keyword);

  Future<void> clearSearchHistory(String uid);
}
