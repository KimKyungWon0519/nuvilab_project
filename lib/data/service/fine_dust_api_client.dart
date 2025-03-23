import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/core/network/retry_interceptor.dart';
import 'package:nuvilab_project/data/model/get_mesuring_list_param.dart';
import 'package:nuvilab_project/data/model/api_service_result.dart';

class FineDustApiClient {
  late final Dio _dio;

  FineDustApiClient({
    required Dio dio,
  }) : _dio = dio {
    _dio.interceptors.add(RetryInterceptor(dio: _dio));
  }

  Future<ApiServiceResult> getMesuringList(GetMesuringListParam param) async {
    try {
      Response response = await _dio.get(
        getMesuringListPath,
        queryParameters: param.toJson(),
      );
      ApiServiceResult responseResult =
          ApiServiceResult.fromJson(response.data['response']);

      Logger()
          .i('FineDustApiClient.getMesuringList - ${responseResult.header}');

      return responseResult;
    } catch (error, stackTrace) {
      Logger().e(
        'FineDustApiClient.getMesuringList',
        error: error,
        stackTrace: stackTrace,
      );

      return ApiServiceResult(
        header: Header(resultMsg: '통신 오류', resultCode: '-1'),
        body: null,
      );
    }
  }
}
