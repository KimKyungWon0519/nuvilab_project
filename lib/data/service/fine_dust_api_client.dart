import 'package:dio/dio.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/data/model/response_result.dart';

class FineDustApiClient {
  late final Dio _dio;

  FineDustApiClient({
    required Dio dio,
  }) : _dio = dio;

  Future<ResponseResult> getAveragePM10() async {
    return _dio.get(
      getMesuringList,
      queryParameters: {
        'itemCode': 'PM10',
        'dataGubun': 'HOUR',
      },
    ).then((value) => ResponseResult.fromJson(value.data['response']));
  }
}
