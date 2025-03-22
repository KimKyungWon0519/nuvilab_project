import 'package:dio/dio.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';

class FineDustApiClient {
  late final Dio _dio;

  FineDustApiClient({
    required Dio dio,
  }) : _dio = dio;

  getAveragePM10() async {
    return _dio.get(
      getMesuringList,
      queryParameters: {
        'itemCode': 'PM10',
        'dataGubun': 'HOUR',
      },
    );
  }
}
