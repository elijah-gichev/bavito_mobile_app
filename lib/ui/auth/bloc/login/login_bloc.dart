import 'package:bavito/models/user.dart';
import 'package:bavito/network/dio_auth_service.dart';
import 'package:bavito/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService _userService;

  late final DioAuthService _dioAuthService;

  LoginBloc(
    this._userService,
  ) : super(LoginInitial()) {
    _dioAuthService = DioAuthService(Dio());

    on<LoginAttempted>(
      (event, emit) async {
        try {
          emit(LoginInProgress());

          final email = event.email;
          final pwd = event.pwd;

          final user = await _dioAuthService.loginWithEmailAndPassword(
              email: email, password: pwd);

          _userService.createUser(user);

          emit(LoginDone());
        } catch (e) {
          final msg = 'Что-то пошло не так!';
          emit(LoginFailure(msg));
        }
      },
    );
  }
}
