part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginAttempted extends LoginEvent {
  final String email;
  final String pwd;

  LoginAttempted(this.email, this.pwd);
}
