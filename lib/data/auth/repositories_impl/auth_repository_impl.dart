import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/common/mappers/user_mapper.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/data/auth/data_sources/auth_firebase_service.dart';
import 'package:kk_movie_app/data/auth/models/user_signin_req.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> signIn(
    UserSignInReq userSignInReq,
  ) async {
    try {
      final result = await getIt<AuthFirebaseService>().signIn(userSignInReq);
      return Right(UserMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
    UserSignUpReq userSignUpReq,
  ) async {
    try {
      final result = await getIt<AuthFirebaseService>().signUp(userSignUpReq);
      return Right(UserMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final result = await getIt<AuthFirebaseService>().signInWithGoogle();
      return Right(UserMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    try {
      final result = await getIt<AuthFirebaseService>().sendPasswordResetEmail(
        email,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final result = await getIt<AuthFirebaseService>().getCurrentUser();
      return Right(UserMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    return await getIt<AuthFirebaseService>().signOut();
  }
}
