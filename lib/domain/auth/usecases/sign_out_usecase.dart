import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  @override
  Future<void> call(NoParams params) {
    return getIt<AuthRepository>().signOut();
  }
}
