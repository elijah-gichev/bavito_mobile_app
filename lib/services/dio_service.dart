import 'package:dio/dio.dart';

///Provides a single entry point for [Dio] client.
class DioService {
  final Dio client;

  DioService(this.client);

  static const baseUrl = 'http://0.0.0.0:3000';

  ///Creates a default dio client without an authorization header
  DioService.baseClient()
      : client = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            contentType: Headers.jsonContentType,
          ),
        );

  ///Adding an `Authorization` header to [client]
  void addToken(String token) {
    client.options.headers = {
      'token': token,
    };
  }
}
