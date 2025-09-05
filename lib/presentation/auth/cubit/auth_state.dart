import 'package:equatable/equatable.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity userEntity;

  const Authenticated({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class Unauthenticated extends AuthState {}

class AuthForgotPasswordSuccess extends AuthState {
  final String message;

  const AuthForgotPasswordSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
  @override
  List<Object?> get props => [message];
}
