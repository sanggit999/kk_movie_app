import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/data/auth/models/user_model.dart';
import 'package:kk_movie_app/data/auth/models/user_signin_req.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';

abstract class AuthFirebaseService {
  Future<UserModel> signIn(UserSignInReq userSignInReq);
  Future<UserModel> signUp(UserSignUpReq userSignUpReq);
  Future<UserModel> signInWithGoogle();
  Future<String> sendPasswordResetEmail(String email);
  Future<UserModel> getCurrentUser();
  Future<void> signOut();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  bool _isInitialize = false;

  @override
  Future<UserModel> signIn(UserSignInReq userSignInReq) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: userSignInReq.email,
            password: userSignInReq.password,
          );

      final user = userCredential.user;
      if (user == null) {
        throw const (message: 'user-not-found');
      }

      UserModel userModel = UserModel(
        uid: user.uid,
        email: userSignInReq.email,
        name: user.displayName ?? '',
        avatarUrl: user.photoURL ?? '',
        provider: 'email',
        createdAt: DateTime.now(),
      );
      return userModel;
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-credential') {
        message = 'invalid-credential';
      }
      throw ServerException(message: message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signUp(UserSignUpReq userSignUpReq) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: userSignUpReq.email,
            password: userSignUpReq.password,
          );

      final user = userCredential.user;
      if (user == null) {
        throw ServerException(message: 'user-not-found');
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

      return userModel;
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'email-already-in-use') {
        message = 'email-already-in-use';
      }
      throw ServerException(message: message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
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
        throw ServerException(message: 'user-not-found');
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

      return userModel;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return 'reset-email-sent';
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.code);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser != null) {
        final providerId = firebaseUser.providerData.isNotEmpty
            ? firebaseUser.providerData[0].providerId
            : 'email';

        UserModel userModel = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          name: firebaseUser.displayName ?? '',
          avatarUrl: firebaseUser.photoURL ?? '',
          provider: providerId == 'password' ? 'email' : providerId,
          createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
        );
        return userModel;

      }

      throw ServerException(message: 'user-not-found');
    } catch (e) {
      throw Left(ServerException(message: e.toString()));
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
