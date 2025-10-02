import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/search/usecases/search_movie_usecase.dart';
import 'package:kk_movie_app/presentation/search/cubit/search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit() : super(SearchMovieInitial());

  Future<void> search(String keyword) async {
    emit(SearchMovieLoading());
    final result = await getIt<SearchMovieUseCase>().call(keyword);
    result.fold(
      (error) => emit(SearchMovieError(message: error.message!)),
      (data) => emit(SearchMovieLoaded(movies: data)),
    );
  }

  void clear() {
    emit(SearchMovieInitial());
  }
}
