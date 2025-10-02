import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/search/repositories/search_repository.dart';

class DeleteSearchHistoryItemUseCase implements UseCase<void, SearchParams> {
  @override
  Future<void> call(SearchParams params) {
    return getIt<SearchRepository>().deleteSearchHistoryItem(
      params.uid,
      params.id,
    );
  }
}
