import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/core/network/retry_interceptor.dart';
import 'package:nuvilab_project/data/model/response_result.dart';

class FineDustApiClient {
  late final Dio _dio;

  FineDustApiClient({
    required Dio dio,
  }) : _dio = dio {
    _dio.interceptors.add(RetryInterceptor(dio: _dio));
  }

  Future<ResponseResult> getAveragePM10() async {
    return _dio.get(
      getMesuringList,
      queryParameters: {
        'itemCode': 'PM10',
        'dataGubun': 'HOUR',
      },
    ).then(
      (value) {
        ResponseResult responseResult =
            ResponseResult.fromJson(value.data['response']);

        Logger()
            .i('FineDustApiClient.getAveragePM10 - ${responseResult.header}');

        return responseResult;
      },
      onError: (error, stackTrace) {
        Logger().e(
          'FineDustApiClient.getAveragePM10',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }

  Future<ResponseResult> getAveragePM25() async {
    return _dio.get(
      getMesuringList,
      queryParameters: {
        'itemCode': 'PM25',
        'dataGubun': 'HOUR',
      },
    ).then(
      (value) {
        ResponseResult responseResult =
            ResponseResult.fromJson(value.data['response']);

        Logger()
            .i('FineDustApiClient.getAveragePM2.5 - ${responseResult.header}');

        return responseResult;
      },
      onError: (error, stackTrace) {
        Logger().e(
          'FineDustApiClient.getAveragePM2.5',
          error: error,
          stackTrace: stackTrace,
        );
      },
    );
  }
}
