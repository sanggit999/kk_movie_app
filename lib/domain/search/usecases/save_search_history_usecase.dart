import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';
import 'package:kk_movie_app/domain/search/repositories/search_repository.dart';

class SaveSearchHistoryUseCase implements UseCase<void, SearchHistoryEntity> {
  @override
  Future<void> call(SearchHistoryEntity entity) {
    return getIt<SearchRepository>().saveSearchHistory(entity);
  }
}
