import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_cartoon_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_new_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_series_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_single_movie_usecase.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> getAllDatas() async {
    await Future.wait([
      getNewMovie(),
      getSeriesMovie(),
      getSingleMovie(),
      getCartoonMovie(),
    ]);
  }

  Future<void> getNewMovie() async {
    emit(state.copyWith(isNewMovieLoading: true, errorNewMovie: null));
    final result = await getIt<GetNewMovieUseCase>().call(const NoParams());
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isNewMovieLoading: false,
            errorNewMovie: error.message,
          ),
        );
      },
      (data) {
        emit(state.copyWith(isNewMovieLoading: false, newMovie: data));
      },
    );
  }

  Future<void> getSeriesMovie() async {
    emit(state.copyWith(isSeriesMovieLoading: true, errorSeriesMovie: null));
    final result = await getIt<GetSeriesMovieUseCase>().call(const NoParams());
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isSeriesMovieLoading: false,
            errorSeriesMovie: error.message,
          ),
        );
      },
      (data) {
        emit(state.copyWith(isSeriesMovieLoading: false, seriesMovie: data));
      },
    );
  }

  Future<void> getSingleMovie() async {
    emit(state.copyWith(isSingleMovieLoading: true, errorSingleMovie: null));
    final result = await getIt<GetSingleMovieUseCase>().call(const NoParams());
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isSingleMovieLoading: false,
            errorSingleMovie: error.message,
          ),
        );
      },
      (data) {
        emit(state.copyWith(isSingleMovieLoading: false, singleMovie: data));
      },
    );
  }

  Future<void> getCartoonMovie() async {
    emit(state.copyWith(isCartoonMovieLoading: true, errorCartoonMovie: null));
    final result = await getIt<GetCartoonMovieUseCase>().call(const NoParams());
    result.fold(
      (error) {
        emit(
          state.copyWith(
            isCartoonMovieLoading: false,
            errorCartoonMovie: error.message,
          ),
        );
      },
      (data) {
        emit(state.copyWith(isCartoonMovieLoading: false, cartoonMovie: data));
      },
    );
  }
}
