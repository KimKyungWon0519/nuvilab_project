import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/data/model/mesuring_data_isar.dart';
import 'package:nuvilab_project/data/repositoies/fine_dust_repository_impl.dart';
import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';
import 'package:nuvilab_project/data/service/fine_dust_local_storage.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initialize() async {
  Directory dir = await getApplicationDocumentsDirectory();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
      },
    ),
  );
  Isar isar = Isar.openSync(
    [MesuringDataIsarSchema],
    directory: dir.path,
  );

  FineDustLocalStorage fineDustLocalStorage = FineDustLocalStorage(isar: isar);
  FineDustApiClient fineDustApiClient = FineDustApiClient(dio: dio);

  FineDustRepository fineDustRepository = FineDustRepositoryImpl(
    fineDustApiClient: fineDustApiClient,
    fineDustLocalStorage: fineDustLocalStorage,
  );

  GetIt.I.registerLazySingleton<FineDustRepository>(() => fineDustRepository);
}
