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
    this.sortType,
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

  @override
  String toString() {
    return 'ViewAllState(movies: ${movies.length}, '
        'isLoading: $isLoading, '
        'isLoadingPage: $isLoadingPage, '
        'hasMore: $hasMore, '
        'error: $error, '
        'sortType: $sortType, '
        'sortLang: $sortLang)';
  }
}
