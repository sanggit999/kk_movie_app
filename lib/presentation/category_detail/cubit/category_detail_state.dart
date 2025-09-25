import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

abstract class CategoryDetailState {}

class CategoryDetailInitial extends CategoryDetailState {}

class CategoryDetailLoading extends CategoryDetailState {}

class CategoryDetailLoaded extends CategoryDetailState {
  final List<MovieEntity> movieEntity;

  CategoryDetailLoaded({required this.movieEntity});
}

class CategoryDetailError extends CategoryDetailState {
  final String message;

  CategoryDetailError({required this.message});
}
