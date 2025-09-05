import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failure.dart';

abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

class NoParams {
  const NoParams();
}
