part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class SuccessState extends AuthenticationState {
  final String name;
  SuccessState({required this.name});
}

class ErrorState extends AuthenticationState {
  final String message;

  ErrorState({required this.message});
}
