import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

class HomeState extends Equatable {
  final List<MovieEntity> newMovie;
  final bool isNewMovieLoading;
  final String? errorNewMovie;

  final List<MovieEntity> seriesMovie;
  final bool isSeriesMovieLoading;
  final String? errorSeriesMovie;

  final List<MovieEntity> singleMovie;
  final bool isSingleMovieLoading;
  final String? errorSingleMovie;

  final List<MovieEntity> cartoonMovie;
  final bool isCartoonMovieLoading;
  final String? errorCartoonMovie;

  const HomeState({
    this.newMovie = const [],
    this.isNewMovieLoading = false,
    this.errorNewMovie,
    this.seriesMovie = const [],
    this.isSeriesMovieLoading = false,
    this.errorSeriesMovie,
    this.singleMovie = const [],
    this.isSingleMovieLoading = false,
    this.errorSingleMovie,
    this.cartoonMovie = const [],
    this.isCartoonMovieLoading = false,
    this.errorCartoonMovie,
  });

  HomeState copyWith({
    List<MovieEntity>? newMovie,
    bool? isNewMovieLoading,
    String? errorNewMovie,
    List<MovieEntity>? seriesMovie,
    bool? isSeriesMovieLoading,
    String? errorSeriesMovie,
    List<MovieEntity>? singleMovie,
    bool? isSingleMovieLoading,
    String? errorSingleMovie,
    List<MovieEntity>? cartoonMovie,
    bool? isCartoonMovieLoading,
    String? errorCartoonMovie,
  }) {
    return HomeState(
      newMovie: newMovie ?? this.newMovie,
      isNewMovieLoading: isNewMovieLoading ?? this.isNewMovieLoading,
      errorNewMovie: errorNewMovie ?? this.errorNewMovie,
      seriesMovie: seriesMovie ?? this.seriesMovie,
      isSeriesMovieLoading: isSeriesMovieLoading ?? this.isSeriesMovieLoading,
      errorSeriesMovie: errorSeriesMovie ?? this.errorSeriesMovie,
      singleMovie: singleMovie ?? this.singleMovie,
      isSingleMovieLoading: isSingleMovieLoading ?? this.isSingleMovieLoading,
      errorSingleMovie: errorSingleMovie ?? this.errorSingleMovie,
      cartoonMovie: cartoonMovie ?? this.cartoonMovie,
      isCartoonMovieLoading:
          isCartoonMovieLoading ?? this.isCartoonMovieLoading,
      errorCartoonMovie: errorCartoonMovie ?? this.errorCartoonMovie,
    );
  }

  @override
  List<Object?> get props => [
    newMovie,
    isNewMovieLoading,
    errorNewMovie,
    seriesMovie,
    isSeriesMovieLoading,
    errorSeriesMovie,
    singleMovie,
    isSingleMovieLoading,
    errorSingleMovie,
    cartoonMovie,
    isCartoonMovieLoading,
    errorCartoonMovie,
  ];
}
