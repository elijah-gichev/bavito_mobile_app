part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterInProgress extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errorMsg;

  RegisterFailure(this.errorMsg);
}

class RegisterDone extends RegisterState {}
