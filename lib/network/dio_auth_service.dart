import 'dart:async';

import 'package:bavito/models/params_user_data_model.dart';
import 'package:bavito/models/user.dart';
import 'package:dio/dio.dart';

import 'exceptions/api_request_exception.dart';

class DioAuthService {
  final Dio dio;

  DioAuthService(this.dio) {
    dio.options.validateStatus = (status) {
      return status! >= 200 && status < 500;
    };
  }

  ///Send a request to server to register a user.
  ///
  ///If it is succeeded - returns a UserDataModel
  ///
  ///In case of failure `throws` an instance of [ApiRequestException]
  ///
  ///In case of timeout (no matter, server or client issue) - `throws` a [TimeoutException]
  ///
  Future<User> registerUser(ParamsUserDataModel data) async {
    try {
      var response = await dio.post(
        'http://0.0.0.0:3000/users',
        data: {
          "user": {
            "email": data.email,
            "password": data.password,
            "password_confirmation": data.passwordConfirmation,
            "name": data.name,
            "phone": data.phone,
          },
        },
      );
      var body = response.data as Map;

      if (response.statusCode == 200) {
        return User.fromMap(
          (body as Map<String, dynamic>)['user'],
        );
      } else {
        final statusCode = response.statusCode;

        if (statusCode == 404) {
          throw UserAlreadyExists('Пользователь уже существует');
        }

        if (statusCode == 400) {
          final errors = (response.data['error'] as List);

          final errorMsg = errors.join('\n');

          throw OtherException(errorMsg);
        }

        throw OtherException('Что-то пошло не так!');
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw TimeoutException('connection or sending timeout');
      }
      rethrow;
    }
  }

  ///Send a request to server to login based on user's data [email] and [password].
  ///
  ///If it is succeeded - returns a [ResponseUserDataModel]
  ///
  ///In case of failure returns an instance of [ApiRequestException]
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var res = await dio.post(
        'http://0.0.0.0:3000/auth',
        data: {
          "user": {
            "email": email,
            "password": password,
          }
        },
      );
      var body = (res.data as Map);

      if (res.statusCode == 200) {
        final user = User.fromMap(body['user']);
        return user;
      } else {
        if (res.statusCode == 404) {
          throw UserNotExists('Пользователь не найден!');
        }
        throw OtherException('Что-то пошло не так!');
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout) {
        throw TimeoutException('connection or sending timeout');
      }
      rethrow;
    }
  }
}
