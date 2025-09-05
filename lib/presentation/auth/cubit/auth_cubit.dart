import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/errors/failure.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/data/auth/models/user_login_req.dart';
import 'package:kk_movie_app/data/auth/models/user_signup_req.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/usecases/get_current_user_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/login_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/send_password_reset_email_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signin_with_google_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signout_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signup_usecase.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  UserEntity? _currentUser;

  UserEntity? get currentUser => _currentUser;

  Future<void> checkAuth() async {
    emit(AuthLoading());
    final user = await getIt<GetCurrentUserUseCase>().call(const NoParams());
    return user.fold(
      (_) {
        emit(Unauthenticated());
      },
      (data) {
        _currentUser = data;
        emit(Authenticated(userEntity: data));
      },
    );
  }

  Future<void> signin(UserLoginReq userLoginReq) async {
    emit(AuthLoading());
    final user = await getIt<LoginUseCase>().call(userLoginReq);

    return user.fold(
      (error) {
        emit(AuthError(message: error.toString()));
      },
      (data) {
        emit(Authenticated(userEntity: data));
      },
    );
  }

  Future<void> signup(UserSignUpReq userSignUpReq) async {
    emit(AuthLoading());
    final user = await getIt<SignupUseCase>().call(userSignUpReq);

    return user.fold(
      (error) {
        emit(AuthError(message: error.toString()));
      },
      (data) {
        emit(Authenticated(userEntity: data));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final user = await getIt<SigninWithGoogleUseCase>().call(const NoParams());

    return user.fold(
      (error) {
        emit(AuthError(message: error.toString()));
      },
      (data) {
        emit(Authenticated(userEntity: data));
      },
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());
    final message = await getIt<SendPasswordResetEmailUseCase>().call(email);
    return message.fold(
      (error) {
        emit(AuthError(message: error.toString()));
      },
      (data) {
        emit(AuthForgotPasswordSuccess(message: data));
      },
    );
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await getIt<SignOutUseCase>().call(const NoParams());
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
