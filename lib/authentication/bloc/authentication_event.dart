part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoginWithEmailAndPasswordEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}

class CreateAccountEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String name;

  CreateAccountEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}
