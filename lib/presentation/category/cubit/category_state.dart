import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categoryEntity;

  CategoryLoaded({required this.categoryEntity});

  @override
  List<Object?> get props => [categoryEntity];
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});

  @override
  List<Object?> get props => [message];
}
