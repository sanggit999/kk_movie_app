import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_type.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_cartoon_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_series_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_single_movie_usecase.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_state.dart';

class ViewAllCubit extends Cubit<ViewAllState> {
  ViewAllCubit({required this.movieType}) : super(const ViewAllState());
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  final List<MovieEntity> _movieEntity = [];
  String currentFilter = "desc";
  Timer? _debounce;
  MovieType movieType;

  Future<void> getViewAllSeriesMovie() async {
    if (_isLoading || !_hasMore) return;

    final isInitialLoad = _movieEntity.isEmpty;
    _isLoading = true;

    if (isInitialLoad) {
      emit(
        state.copyWith(
          viewAllSeriesMovie: List.from(_movieEntity),
          isViewAllSeriesMovieLoading: true,
          errorViewAllSeriesMovie: null,
          isLoadingPage: false,
          hasMore: _hasMore,
        ),
      );
    } else {
      emit(state.copyWith(isLoadingPage: true));
    }

    final result = await getIt<GetViewAllSeriesMovieUseCase>().call(
      GetViewAllParams(
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
            isViewAllSeriesMovieLoading: false,
            errorViewAllSeriesMovie: error.message,
            isLoadingPage: false,
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
            viewAllSeriesMovie: List.from(_movieEntity),
            isViewAllSeriesMovieLoading: false,
            isLoadingPage: false,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> getViewAllSingleMovie() async {
    if (_isLoading || !_hasMore) return;

    final isInitialLoad = _movieEntity.isEmpty;
    _isLoading = true;

    if (isInitialLoad) {
      emit(
        state.copyWith(
          viewAllSingleMovie: List.from(_movieEntity),
          isViewAllSingleMovieLoading: true,
          errorViewAllSingleMovie: null,
          isLoadingPage: false,
          hasMore: _hasMore,
        ),
      );
    } else {
      emit(state.copyWith(isLoadingPage: true));
    }

    final result = await getIt<GetViewAllSingleMovieUseCase>().call(
      GetViewAllParams(
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
            isViewAllSingleMovieLoading: false,
            errorViewAllSingleMovie: error.message,
            isLoadingPage: false,
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
            viewAllSingleMovie: List.from(_movieEntity),
            isViewAllSingleMovieLoading: false,
            isLoadingPage: false,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> getViewAllCartoonMovie() async {
    if (_isLoading || !_hasMore) return;

    final isInitialLoad = _movieEntity.isEmpty;
    _isLoading = true;

    if (isInitialLoad) {
      emit(
        state.copyWith(
          viewAllCartoonMovie: List.from(_movieEntity),
          isViewAllCartoonMovieLoading: true,
          errorViewAllCartoonMovie: null,
          isLoadingPage: false,
          hasMore: _hasMore,
        ),
      );
    } else {
      emit(state.copyWith(isLoadingPage: true));
    }

    final result = await getIt<GetViewAllCartoonMovieUseCase>().call(
      GetViewAllParams(
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
            isViewAllCartoonMovieLoading: false,
            errorViewAllCartoonMovie: error.message,
            isLoadingPage: false,
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
            viewAllCartoonMovie: List.from(_movieEntity),
            isViewAllCartoonMovieLoading: false,
            isLoadingPage: false,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> resetSeriesMovie() async {
    _page = 1;
    _hasMore = true;
    _movieEntity.clear();
    emit(state.copyWith(isViewAllSeriesMovieLoading: true));
    await getViewAllSeriesMovie();
  }

  Future<void> resetSingleMovie() async {
    _page = 1;
    _hasMore = true;
    _movieEntity.clear();
    emit(state.copyWith(isViewAllSingleMovieLoading: true));
    await getViewAllSingleMovie();
  }

  Future<void> resetCartoonMovie() async {
    _page = 1;
    _hasMore = true;
    _movieEntity.clear();
    emit(state.copyWith(isViewAllCartoonMovieLoading: true));
    await getViewAllCartoonMovie();
  }

  void applyDropdownFilter(String value) {
    currentFilter = value;
    if (value == 'desc') {
      emit(state.copyWith(sortType: 'desc'));
    } else if (value == 'asc') {
      emit(state.copyWith(sortType: 'asc'));
    } else if (value == 'vietsub') {
      emit(state.copyWith(sortLang: 'vietsub'));
    } else if (value == 'thuyet-minh') {
      emit(state.copyWith(sortLang: 'thuyet-minh'));
    } else if (value == 'long-tieng') {
      emit(state.copyWith(sortLang: 'long-tieng'));
    }
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _movieEntity.clear();
      _page = 1;
      _hasMore = true;

      emit(state.copyWith(isViewAllSeriesMovieLoading: true));
      _fetchMovies();
    });
  }

  void _fetchMovies() {
    switch (movieType) {
      case MovieType.series:
        getViewAllSeriesMovie();
        break;
      case MovieType.cartoon:
        getViewAllCartoonMovie();
        break;
      case MovieType.single:
        getViewAllSingleMovie();
        break;
    }
  }
}
