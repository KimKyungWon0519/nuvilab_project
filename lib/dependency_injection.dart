import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/data/repositoies/fine_dust_repository_impl.dart';
import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';

void initialize() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
      },
    ),
  );
  FineDustApiClient fineDustApiClient = FineDustApiClient(dio: dio);
  FineDustRepository fineDustRepository =
      FineDustRepositoryImpl(fineDustApiClient: fineDustApiClient);

  GetIt.I.registerLazySingleton<FineDustRepository>(() => fineDustRepository);
}
