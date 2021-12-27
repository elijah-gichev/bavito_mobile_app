import 'package:bavito/models/params_user_data_model.dart';
import 'package:bavito/network/dio_auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late final DioAuthService _dioAuthService;

  RegisterBloc() : super(RegisterInitial()) {
    _dioAuthService = DioAuthService(Dio());

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
          final msg = 'Что-то пошло не так!';
          emit(RegisterFailure(msg));
        }
      },
    );
  }
}
