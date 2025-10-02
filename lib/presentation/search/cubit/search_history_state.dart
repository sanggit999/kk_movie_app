import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';

abstract class SearchHistoryState extends Equatable {
  const SearchHistoryState();

  @override
  List<Object?> get props => [];
}

class SearchHistoryInitial extends SearchHistoryState {}

class SearchHistoryLoading extends SearchHistoryState {}

class SearchHistoryLoaded extends SearchHistoryState {
  final List<SearchHistoryEntity> histories;

  const SearchHistoryLoaded({required this.histories});

  @override
  List<Object?> get props => [histories];
}

class SearchHistoryError extends SearchHistoryState {
  final String message;

  const SearchHistoryError({required this.message});

  @override
  List<Object?> get props => [message];
}

class SearchHistoryActionSuccess extends SearchHistoryState {
  final String message;

  const SearchHistoryActionSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}
