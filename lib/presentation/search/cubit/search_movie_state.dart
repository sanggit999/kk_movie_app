import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object?> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movies;

  const SearchMovieLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class SearchMovieError extends SearchMovieState {
  final String message;

  const SearchMovieError({required this.message});

  @override
  List<Object?> get props => [message];
}
