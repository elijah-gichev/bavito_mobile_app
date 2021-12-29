import 'package:bavito/main.dart';
import 'package:bavito/network/auth_network.dart';
import 'package:bavito/network/exceptions/api_request_exception.dart';
import 'package:bavito/services/dio_service.dart';
import 'package:bavito/services/user_service.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService _userService;

  late final AuthNetwork _dioAuthService;

  LoginBloc(
    this._userService,
  ) : super(LoginInitial()) {
    _dioAuthService = AuthNetwork(getIt<DioService>());

    on<LoginAttempted>(
      (event, emit) async {
        try {
          emit(LoginInProgress());

          final email = event.email;
          final pwd = event.pwd;

          final user = await _dioAuthService.loginWithEmailAndPassword(
            email: email,
            password: pwd,
          );

          _userService.createUser(user);

          emit(LoginDone());
        } catch (e) {
          final defaultMsg = 'Что-то пошло не так!';

          if (e is ApiRequestException) {
            emit(LoginFailure(e.errorMsg));
          } else {
            emit(LoginFailure(defaultMsg));
          }
        }
      },
    );
  }
}
