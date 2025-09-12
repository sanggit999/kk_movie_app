import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class SignUpUseCase
    implements UseCase<Either<Failure, UserEntity>, UserSignUpReq> {
  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpReq params) {
    return getIt<AuthRepository>().signUp(params);
  }
}
