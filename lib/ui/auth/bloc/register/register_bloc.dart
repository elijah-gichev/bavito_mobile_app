import 'package:bavito/main.dart';
import 'package:bavito/models/params_user_data_model.dart';
import 'package:bavito/network/auth_network.dart';
import 'package:bavito/network/exceptions/api_request_exception.dart';
import 'package:bavito/services/dio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late final AuthNetwork _dioAuthService;

  RegisterBloc() : super(RegisterInitial()) {
    _dioAuthService = AuthNetwork(getIt<DioService>());

    on<RegisterAttempted>(
      (event, emit) async {
        try {
          emit(RegisterInProgress());

          final pwd = event.userParams.password;
          final repeatedPwd = event.userParams.passwordConfirmation;

          if (pwd != repeatedPwd) {
            emit(RegisterFailure('Пароли должны совпадать!'));
            return;
          }

          final user = await _dioAuthService.registerUser(event.userParams);

          emit(RegisterDone());
        } catch (e) {
          final defaultMsg = 'Что-то пошло не так!';

          if (e is ApiRequestException) {
            emit(RegisterFailure(e.errorMsg));
          } else {
            emit(RegisterFailure(defaultMsg));
          }
        }
      },
    );
  }
}
