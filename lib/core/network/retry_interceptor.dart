import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RetryInterceptor extends Interceptor {
  final int _maxRetryAttempts = 5;
  final int _intialMS = 250;

  late final Dio _dio;

  RetryInterceptor({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    int retryCount = (err.requestOptions.extra['retryCount'] ?? 0) + 1;

    if (!_shouldRetry(err, retryCount)) {
      handler.reject(err);

      return;
    }

    err.requestOptions.extra['retryCount'] = retryCount;
    int deley = _intialMS * 1 << (retryCount - 1);

    Logger().d('연결 실패 재시도 중... 횟수 : $retryCount, 지연시간 : $deley');

    await Future.delayed(Duration(milliseconds: deley));

    try {
      handler.resolve(await _dio.fetch(err.requestOptions));
    } catch (e) {
      handler.reject(err);
    }
  }

  bool _shouldRetry(DioException err, int retryCount) {
    if (retryCount > _maxRetryAttempts) {
      return false;
    }

    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.error is SocketException;
  }
}
