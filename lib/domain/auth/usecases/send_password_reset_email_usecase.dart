import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class SendPasswordResetEmailUseCase
    implements UseCase<Either<Failure, String>, String> {
  @override
  Future<Either<Failure, String>> call(String params) {
    return getIt<AuthRepository>().sendPasswordResetEmail(params);
  }
}
