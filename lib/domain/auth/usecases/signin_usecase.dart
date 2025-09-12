import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/data/auth/models/user_signin_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<Either<Failure, UserEntity>, UserSignInReq> {
  @override
  Future<Either<Failure, UserEntity>> call(UserSignInReq params) {
    return getIt<AuthRepository>().signIn(params);
  }
}
