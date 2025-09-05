import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failure.dart';
import 'package:kk_movie_app/data/auth/models/user_login_req.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(UserLoginReq userLoginReq);
  Future<Either<Failure, UserEntity>> signUp(UserSignUpReq userSignUpReq);
  Future<Either<Failure,UserEntity>> signInWithGoogle();
  Future<Either<Failure,String>> sendPasswordResetEmail(String email);
  Future<Either<Failure,UserEntity>> getCurrentUser();
  Future<void> signOut();
  //Future<Either> getUser();
}
