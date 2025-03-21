import 'package:dio/dio.dart';

class FineDustApiClient {
  late final Dio _dio;

  FineDustApiClient({
    required Dio dio,
  }) : _dio = dio;
}
