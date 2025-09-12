import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/auth/usecases/get_current_user_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/send_password_reset_email_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signin_with_google_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/sign_out_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signup_usecase.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  UserEntity? _currentUser;

  UserEntity? get currentUser => _currentUser;

  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
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

  Future<void> signInWithGoogle() async {
    final user = await getIt<SigninWithGoogleUseCase>().call(const NoParams());

    return user.fold(
      (error) {
        emit(AuthError(message: error.message!));
      },
      (data) {
        emit(Authenticated(userEntity: data));
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
