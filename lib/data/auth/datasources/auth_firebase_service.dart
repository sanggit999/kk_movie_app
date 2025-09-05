import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kk_movie_app/common/mappers/user_mapper.dart';
import 'package:kk_movie_app/core/errors/failure.dart';
import 'package:kk_movie_app/data/auth/models/user_login_req.dart';
import 'package:kk_movie_app/data/auth/models/user_model.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';

abstract class AuthFirebaseService {
  Future<Either<Failure, UserEntity>> signIn(UserLoginReq userLoginReq);
  Future<Either<Failure, UserEntity>> signUp(UserSignUpReq userSignUpReq);
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, String>> sendPasswordResetEmail(String email);
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<void> signOut();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool _isInitialize = false;

  @override
  Future<Either<Failure, UserEntity>> signIn(UserLoginReq userLoginReq) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: userLoginReq.email,
            password: userLoginReq.password,
          );

      final user = userCredential.user;
      if (user == null) {
        return const Left(ServerFailure(message: 'user-not-found'));
      }

      UserModel userModel = UserModel(
        uid: user.uid,
        email: userLoginReq.email,
        name: user.displayName ?? '',
        avatarUrl: user.photoURL ?? '',
        provider: 'email',
        createdAt: DateTime.now(),
      );
      return Right(UserMapper.toEntity(userModel));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return const Left(ServerFailure(message: 'user-not-found'));
        case 'wrong-password':
          return const Left(ServerFailure(message: 'wrong-password'));
        case 'invalid-email':
          return const Left(ServerFailure(message: 'invalid-email'));
        case 'user-disabled':
          return const Left(ServerFailure(message: 'user-disabled'));
        default:
          return Left(ServerFailure(message: e.message ?? 'unknown-error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
    UserSignUpReq userSignUpReq,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: userSignUpReq.email,
            password: userSignUpReq.password,
          );

      final user = userCredential.user;
      if (user == null) {
        return const Left(ServerFailure(message: 'user-not-found'));
      }

      UserModel userModel = UserModel(
        uid: user.uid,
        email: userSignUpReq.email,
        name: userSignUpReq.name,
        provider: 'email',
        createdAt: DateTime.now(),
      );

      final userDoc = _firebaseFirestore.collection('Users').doc(user.uid);
      await userDoc.set(userModel.toJson());

      return Right(UserMapper.toEntity(userModel));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return const Left(ServerFailure(message: 'email-already-in-use'));
        case 'invalid-email':
          return const Left(ServerFailure(message: 'invalid-email'));
        case 'operation-not-allowed':
          return const Left(ServerFailure(message: 'operation-not-allowed'));
        case 'weak-password':
          return const Left(ServerFailure(message: 'weak-password'));
        default:
          return Left(ServerFailure(message: e.message ?? 'unknown-error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      if (!_isInitialize) {
        await _googleSignIn.initialize(
          serverClientId:
              '182351976362-dlc7cqmb30gpvc5h7c2dqrsdntaqta8o.apps.googleusercontent.com',
        );
        _isInitialize = true;
      }

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;
      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes(['email', 'profile']);

      final accessToken = authorization?.accessToken;
      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );
        if (authorization2?.accessToken == null) {
          throw FirebaseAuthException(
            code: "error",
            message: "no-access-token",
          );
        }
        authorization = authorization2;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      final user = userCredential.user;
      if (user == null) {
        return const Left(ServerFailure(message: 'user-not-found'));
      }

      UserModel userModel = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        avatarUrl: user.photoURL ?? '',
        provider: 'google',
        createdAt: DateTime.now(),
      );

      final userDoc = _firebaseFirestore.collection('Users').doc(user.uid);
      await userDoc.set(userModel.toJson());

      return Right(UserMapper.toEntity(userModel));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right('reset-email-sent');
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return const Left(ServerFailure(message: 'user-not-found'));
        case 'invalid-email':
          return const Left(ServerFailure(message: 'invalid-email'));
        default:
          return Left(ServerFailure(message: e.message ?? 'unknown-error'));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        final providerId = firebaseUser.providerData.isNotEmpty
            ? firebaseUser.providerData[0].providerId
            : 'email';

        UserEntity userEntity = UserEntity(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
          avatarUrl: firebaseUser.photoURL ?? '',
          provider: providerId == 'password' ? 'email' : providerId,
          createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
        );
        return Right(userEntity);
      }

      return const Left(ServerFailure(message: 'no-user'));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      print("Sign out successful");
    } catch (e) {
      print("Error signing out: $e");
      throw FirebaseAuthException(
        code: 'sign-out-failed',
        message: e.toString(),
      );
    }
  }
}
