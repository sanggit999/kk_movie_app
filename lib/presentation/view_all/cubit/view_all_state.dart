import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';


class ViewAllState extends Equatable {
  final List<MovieEntity> movies;
  final bool isLoading;
  final bool isLoadingPage;
  final bool hasMore;
  final String? error;
  final String? sortType;
  final String? sortLang;

  const ViewAllState({
    this.movies = const [],
    this.isLoading = false,
    this.isLoadingPage = false,
    this.hasMore = true,
    this.error,
    this.sortType = "desc",
    this.sortLang ,
  });

  ViewAllState copyWith({
    List<MovieEntity>? movies,
    bool? isLoading,
    bool? isLoadingPage,
    bool? hasMore,
    String? error,
    String? sortType,
    String? sortLang,
  }) {
    return ViewAllState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      isLoadingPage: isLoadingPage ?? this.isLoadingPage,
      hasMore: hasMore ?? this.hasMore,
      error: error,
      sortType: sortType ?? this.sortType,
      sortLang: sortLang ?? this.sortLang,
    );
  }

  @override
  List<Object?> get props => [
    movies,
    isLoading,
    isLoadingPage,
    hasMore,
    error,
    sortType,
    sortLang,
  ];
}


// class ViewAllState extends Equatable {
//   final List<MovieEntity> viewAllSeriesMovie;
//   final bool isViewAllSeriesMovieLoading;
//   final String? errorViewAllSeriesMovie;
//
//   final List<MovieEntity> viewAllSingleMovie;
//   final bool isViewAllSingleMovieLoading;
//   final String? errorViewAllSingleMovie;
//
//   final List<MovieEntity> viewAllCartoonMovie;
//   final bool isViewAllCartoonMovieLoading;
//   final String? errorViewAllCartoonMovie;
//
//   final bool isLoadingPage;
//   final bool hasMore;
//
//   final String? sortType;
//   final String? sortLang;
//
//   const ViewAllState({
//     this.viewAllSeriesMovie = const [],
//     this.isViewAllSeriesMovieLoading = false,
//     this.errorViewAllSeriesMovie,
//     this.viewAllSingleMovie = const [],
//     this.isViewAllSingleMovieLoading = false,
//     this.errorViewAllSingleMovie,
//     this.viewAllCartoonMovie = const [],
//     this.isViewAllCartoonMovieLoading = false,
//     this.errorViewAllCartoonMovie,
//     this.isLoadingPage = false,
//     this.hasMore = true,
//     this.sortType ,
//     this.sortLang ,
//   });
//
//   ViewAllState copyWith({
//     List<MovieEntity>? viewAllSeriesMovie,
//     bool? isViewAllSeriesMovieLoading,
//     String? errorViewAllSeriesMovie,
//     List<MovieEntity>? viewAllSingleMovie,
//     bool? isViewAllSingleMovieLoading,
//     String? errorViewAllSingleMovie,
//     List<MovieEntity>? viewAllCartoonMovie,
//     bool? isViewAllCartoonMovieLoading,
//     String? errorViewAllCartoonMovie,
//     bool? isLoadingPage,
//     bool? hasMore,
//     String? sortType,
//     String? sortLang,
//   }) {
//     return ViewAllState(
//       viewAllSeriesMovie: viewAllSeriesMovie ?? this.viewAllSeriesMovie,
//       isViewAllSeriesMovieLoading: isViewAllSeriesMovieLoading ?? this.isViewAllSeriesMovieLoading,
//       errorViewAllSeriesMovie: errorViewAllSeriesMovie ?? this.errorViewAllSeriesMovie,
//       viewAllSingleMovie: viewAllSingleMovie ?? this.viewAllSingleMovie,
//       isViewAllSingleMovieLoading: isViewAllSingleMovieLoading ?? this.isViewAllSingleMovieLoading,
//       errorViewAllSingleMovie: errorViewAllSingleMovie ?? this.errorViewAllSingleMovie,
//       viewAllCartoonMovie: viewAllCartoonMovie ?? this.viewAllCartoonMovie,
//       isViewAllCartoonMovieLoading: isViewAllCartoonMovieLoading ?? this.isViewAllCartoonMovieLoading,
//       errorViewAllCartoonMovie: errorViewAllCartoonMovie ?? this.errorViewAllCartoonMovie,
//       isLoadingPage: isLoadingPage ?? this.isLoadingPage,
//       hasMore: hasMore ?? this.hasMore,
//       sortType: sortType ?? this.sortType,
//       sortLang: sortLang ?? this.sortLang,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     viewAllSeriesMovie,
//     isViewAllSeriesMovieLoading,
//     errorViewAllSeriesMovie,
//     viewAllSingleMovie,
//     isViewAllSingleMovieLoading,
//     errorViewAllSingleMovie,
//     viewAllCartoonMovie,
//     isViewAllCartoonMovieLoading,
//     errorViewAllCartoonMovie,
//     isLoadingPage,
//     hasMore,
//     sortType,
//     sortLang,
//   ];
// }
