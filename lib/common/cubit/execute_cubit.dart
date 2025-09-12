import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/execute_state.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';

class ExecuteCubit extends Cubit<ExecuteState> {
  ExecuteCubit() : super(ExecuteInitial());

  Future<void> execute<T, Params>({
    required UseCase<Either<Failure, T>, Params> usecase,
    required Params params,
  }) async {
    emit(ExecuteLoading());
    try {
      final Either<Failure, T> result = await usecase.call(params);
      result.fold(
        (failure) => emit(ExecuteFailure(message: failure.message!)),
        (success) => emit(ExecuteSuccess<T>(data: success)),
      );
    } catch (e) {
      emit(ExecuteFailure(message: e.toString()));
    }
  }
}
