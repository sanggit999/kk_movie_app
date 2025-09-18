import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;

  MovieDetailLoaded({required this.movieDetailEntity});
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError({required this.message});
}
