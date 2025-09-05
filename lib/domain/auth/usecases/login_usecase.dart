import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failure.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/data/auth/models/user_login_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<Either<Failure, UserEntity>, UserLoginReq> {
  @override
  Future<Either<Failure, UserEntity>> call(UserLoginReq params) {
    return getIt<AuthRepository>().signIn(params);
  }
}
