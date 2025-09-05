import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failure.dart';
import 'package:kk_movie_app/data/auth/datasources/auth_firebase_service.dart';
import 'package:kk_movie_app/data/auth/models/user_login_req.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> signIn(UserLoginReq userLoginReq) async {
    return await getIt<AuthFirebaseService>().signIn(userLoginReq);
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
    UserSignUpReq userSignUpReq,
  ) async {
    return await getIt<AuthFirebaseService>().signUp(userSignUpReq);
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    return await getIt<AuthFirebaseService>().signInWithGoogle();
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email)  async {
    return await getIt<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    return await getIt<AuthFirebaseService>().getCurrentUser();
  }

  @override
  Future<void> signOut() async {
    return await getIt<AuthFirebaseService>().signOut();
  }
}
