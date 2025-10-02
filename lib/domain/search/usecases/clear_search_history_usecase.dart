import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/search/repositories/search_repository.dart';

class ClearSearchHistoryUseCase implements UseCase<void, String> {
  @override
  Future<void> call(String params) {
    return getIt<SearchRepository>().clearSearchHistory(params);
  }
}
