part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLading extends AuthState {}


class AuthLoaded extends AuthState {
  final bool isLogIn;

  AuthLoaded({required this.isLogIn});
}

class AuthError extends AuthState {
  final String? message;

  AuthError({this.message});
}
