import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';
import 'package:kk_movie_app/domain/search/repositories/search_repository.dart';

class GetSearchHistoryUseCase
    implements UseCase<Either<Failure, List<SearchHistoryEntity>>, String> {
  @override
  Future<Either<Failure, List<SearchHistoryEntity>>> call(String uid) {
    return getIt<SearchRepository>().getSearchHistory(uid);
  }
}
