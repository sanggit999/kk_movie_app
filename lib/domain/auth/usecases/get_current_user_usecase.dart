import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class GetCurrentUserUseCase
    implements UseCase<Either<Failure, UserEntity>, NoParams> {
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return getIt<AuthRepository>().getCurrentUser();
  }
}
