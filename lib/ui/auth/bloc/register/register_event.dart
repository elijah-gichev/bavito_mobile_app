part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterAttempted extends RegisterEvent {
  final ParamsUserDataModel userParams;

  RegisterAttempted(
    this.userParams,
  );
}
