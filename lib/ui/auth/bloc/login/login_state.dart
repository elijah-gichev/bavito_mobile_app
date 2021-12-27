part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMsg;

  LoginFailure(this.errorMsg);
}

class LoginDone extends LoginState {}
