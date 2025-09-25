import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailLoaded({required this.movieDetailEntity});

  @override
  List<Object?> get props => [movieDetailEntity];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError({required this.message});

  @override
  List<Object?> get props => [message];
}
