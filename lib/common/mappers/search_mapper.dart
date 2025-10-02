import 'package:kk_movie_app/data/search/models/search_history_model.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';

class SearchMapper {
  SearchMapper._();

  static List<SearchHistoryEntity> toEntity(
    List<SearchHistoryModel> searchHistoryModel,
  ) {
    return searchHistoryModel
        .map(
          (e) => SearchHistoryEntity(
            uid: e.uid,
            id: e.id,
            keyword: e.keyword,
            createdAt: e.createdAt!,
          ),
        )
        .toList();
  }

  static SearchHistoryModel toModel(SearchHistoryEntity searchHistoryEntity) {
    return SearchHistoryModel(
      uid: searchHistoryEntity.uid,
      id: searchHistoryEntity.id,
      keyword: searchHistoryEntity.keyword,
      createdAt: searchHistoryEntity.createdAt,
    );
  }
}
