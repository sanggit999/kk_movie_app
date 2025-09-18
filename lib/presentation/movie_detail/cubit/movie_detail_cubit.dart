import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_movie_detail_usecase.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  Future<void> getMovieDetail(String slug) async {
    emit(MovieDetailLoading());

    final result = await getIt<GetMovieDetailUseCase>().call(slug);

    result.fold(
      (error) {
        emit(MovieDetailError(message: error.message!));
      },
      (data) {
        emit(MovieDetailLoaded(movieDetailEntity: data));
      },
    );
  }
}
