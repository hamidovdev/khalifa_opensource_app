part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class ThisUserAuthenticated extends AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final VoidCallback success;
  final VoidCallback failure;
  SignUpEvent({
    required this.email,
    required this.password,
    required this.success,
    required this.failure,
  });
}

class GetUserEvent extends AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final VoidCallback success;
  final VoidCallback failure;
  SignInEvent(
      {required this.email,
      required this.password,
      required this.success,
      required this.failure});
}

class ConfirmCodeEvent extends AuthenticationEvent {
  final String email;
  final int code;
  final VoidCallback success;
  ConfirmCodeEvent({
    required this.email,
    required this.code,
    required this.success,
  });
}

class GetTokenEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final VoidCallback success;
  GetTokenEvent({
    required this.email,
    required this.password,
    required this.success,
  });
}
