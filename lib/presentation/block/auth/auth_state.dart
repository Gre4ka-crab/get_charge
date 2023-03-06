part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}


class AuthLoaded extends AuthState {
  final bool isLogIn;

  AuthLoaded({required this.isLogIn});
}

class AuthError extends AuthState {
  final String? message;

  AuthError({this.message});
}
