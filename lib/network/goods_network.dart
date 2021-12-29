import 'dart:async';
import 'dart:convert';

import 'package:bavito/main.dart';
import 'package:bavito/models/good.dart';
import 'package:bavito/models/user.dart';
import 'package:bavito/network/exceptions/api_request_exception.dart';
import 'package:bavito/services/dio_service.dart';
import 'package:bavito/services/user_service.dart';
import 'package:dio/dio.dart';

class GoodsNetwork {
  final Dio _dio;
  final DioService _dioService;

  GoodsNetwork(this._dioService) : _dio = _dioService.client;

  Future<List<Good>> getGoods() async {
    try {
      var response = await _dio.get(
        '/goods',
      );

      if (response.statusCode == 200) {
        final rawProducts = response.data['products'] as List;
        final products = (response.data['products'] as List)
            .map(
              (p) => Good.fromMap(
                p,
                User.sample1(),
              ),
            )
            .toList();

        return products;
      } else {
        final statusCode = response.statusCode;

        if (statusCode == 403) {
          throw AuthKeyNotFound('Пользователь не зарегистрирован');
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

  Future<List<Good>> getMyGoods(int userId) async {
    try {
      var response = await _dio.get(
        '/users/$userId/goods',
      );

      if (response.statusCode == 200) {
        final rawProducts = response.data['products'] as List;
        final products = (response.data['products'] as List)
            .map((p) => Good.fromMap(
                  p,
                  getIt<UserService>().user!,
                ))
            .toList();

        return products;
      } else {
        final statusCode = response.statusCode;

        if (statusCode == 403) {
          throw AuthKeyNotFound('Пользователь не зарегистрирован');
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
}
