import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity userEntity;

  Authenticated({required this.userEntity});
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
