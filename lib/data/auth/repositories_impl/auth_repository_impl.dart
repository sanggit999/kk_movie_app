import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/common/mappers/user_mapper.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/network/connection_checker.dart';
import 'package:kk_movie_app/data/auth/data_sources/auth_firebase_service.dart';
import 'package:kk_movie_app/data/auth/models/user_model.dart';
import 'package:kk_movie_app/data/auth/models/user_signin_req.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final connectionChecker = getIt<ConnectionChecker>();

  @override
  Future<Either<Failure, UserEntity>> signIn(UserSignInReq userSignInReq) {
    return _getUser(() => getIt<AuthFirebaseService>().signIn(userSignInReq));
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(UserSignUpReq userSignUpReq) {
    return _getUser(() => getIt<AuthFirebaseService>().signUp(userSignUpReq));
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() {
    return _getUser(() => getIt<AuthFirebaseService>().signInWithGoogle());
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(NetworkFailure(message: 'no-connection'));
      }

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
  Future<Either<Failure, UserEntity>> getCurrentUser() {
    return _getUser(() => getIt<AuthFirebaseService>().getCurrentUser());
  }

  @override
  Future<void> signOut() async {
    await getIt<AuthFirebaseService>().signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cached_email');
  }

  Future<Either<Failure, UserEntity>> _getUser(
    Future<UserModel> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return const Left(NetworkFailure(message: 'no-connection'));
      }
      final result = await fn();

      final user = UserMapper.toEntity(result);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('cached_email', user.email);
      print('Saved email to SharedPreferences: ${user.email}');

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
