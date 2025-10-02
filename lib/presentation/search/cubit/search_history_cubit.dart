import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';
import 'package:kk_movie_app/domain/search/usecases/clear_search_history_usecase.dart';
import 'package:kk_movie_app/domain/search/usecases/delete_search_history_item_usecase.dart';
import 'package:kk_movie_app/domain/search/usecases/get_search_history_usecase.dart';
import 'package:kk_movie_app/domain/search/usecases/save_search_history_usecase.dart';
import 'package:kk_movie_app/presentation/search/cubit/search_history_state.dart';

class SearchHistoryCubit extends Cubit<SearchHistoryState> {
  SearchHistoryCubit() : super(SearchHistoryInitial());

  Future<void> getHistory(String uid) async {
    emit(SearchHistoryLoading());
    final result = await getIt<GetSearchHistoryUseCase>().call(uid);
    result.fold(
      (error) => emit(SearchHistoryError(message: error.message!)),
      (data) => emit(SearchHistoryLoaded(histories: data)),
    );
  }

  Future<void> saveHistory(SearchHistoryEntity entity) async {
    emit(SearchHistoryLoading());
    try {
      await getIt<SaveSearchHistoryUseCase>().call(entity);
      emit(const SearchHistoryActionSuccess(message: "Saved successfully"));
      await getHistory(entity.uid);
    } catch (e) {
      emit(SearchHistoryError(message: e.toString()));
    }
  }

  Future<void> deleteHistory(String uid, String id) async {
    //emit(SearchHistoryLoading());
    try {
      await getIt<DeleteSearchHistoryItemUseCase>().call(
        SearchParams(uid: uid, id: id),
      );
      emit(const SearchHistoryActionSuccess(message: "Deleted successfully"));
      await getHistory(uid);
    } catch (e) {
      emit(SearchHistoryError(message: e.toString()));
    }
  }

  Future<void> clearHistory(String uid) async {
    emit(SearchHistoryLoading());
    try {
      await getIt<ClearSearchHistoryUseCase>().call(uid);
      emit(const SearchHistoryActionSuccess(message: "Cleared successfully"));
      emit(const SearchHistoryLoaded(histories: []));
    } catch (e) {
      emit(SearchHistoryError(message: e.toString()));
    }
  }
}
