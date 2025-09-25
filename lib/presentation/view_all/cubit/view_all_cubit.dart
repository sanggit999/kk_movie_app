import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_movies_usecase.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_state.dart';

class ViewAllCubit extends Cubit<ViewAllState> {
  ViewAllCubit({required this.movieType}) : super(const ViewAllState());

  final MovieType movieType;
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  final List<MovieEntity> _movieEntity = [];
  Timer? _debounce;

  Future<void> getViewAll() async {
    if (_isLoading || !_hasMore) return;

    final isInitialLoad = _movieEntity.isEmpty;
    _isLoading = true;

    if (isInitialLoad) {
      emit(
        state.copyWith(
          movies: List.from(_movieEntity),
          isLoading: true,
          error: null,
          isLoadingPage: false,
          hasMore: _hasMore,
        ),
      );
    } else {
      emit(state.copyWith(isLoadingPage: true));
    }

    final result = await getIt<GetViewAllMoviesUseCase>().call(
      GetViewAllParams(
        movieType: movieType,
        page: _page,
        sortType: state.sortType,
        sortLang: state.sortLang,
      ),
    );

    result.fold(
      (error) {
        _isLoading = false;
        emit(
          state.copyWith(
            isLoading: false,
            isLoadingPage: false,
            error: error.message,
            hasMore: _hasMore,
          ),
        );
      },
      (data) {
        if (data.isEmpty) {
          _hasMore = false;
        } else {
          _movieEntity.addAll(data);
          _page++;
        }
        _isLoading = false;
        emit(
          state.copyWith(
            movies: List.from(_movieEntity),
            isLoading: false,
            isLoadingPage: false,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> reset() async {
    _page = 1;
    _hasMore = true;
    _movieEntity.clear();
    emit(
      state.copyWith(movies: [], isLoading: true, error: null, hasMore: true),
    );
    await getViewAll();
  }

  void applyDropdownFilter(String value) {
    if (value == 'desc' || value == 'asc') {
      emit(state.copyWith(sortType: value));
    } else {
      emit(state.copyWith(sortLang: value));
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _movieEntity.clear();
      _page = 1;
      _hasMore = true;

      emit(state.copyWith(isLoading: true, movies: []));
      getViewAll();
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
