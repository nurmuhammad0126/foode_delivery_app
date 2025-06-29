part of 'auth_bloc.dart';

sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  final AuthModel user;
  SignInRequested(this.user);
}

class SignUpRequested extends AuthEvent {
  final AuthModel user;

  SignUpRequested(this.user);
}

class SignOutRequested extends AuthEvent {}
