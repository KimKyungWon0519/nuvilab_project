import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/data/model/api_service_result.dart';
import 'package:nuvilab_project/data/model/get_mesuring_list_param.dart';
import 'package:nuvilab_project/data/model/mesuring_data.dart';
import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';
import 'package:nuvilab_project/data/service/fine_dust_local_storage.dart';

import '../model/mesuring_data_isar.dart';

class SyncDataService {
  static const Duration _syncInterval = Duration(minutes: 10);
  static Timer? timer;

  static void startSync() {
    timer = Timer.periodic(_syncInterval, (timer) {
      fetchData();
    });
  }

  static void stopSync() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
  }

  static Future<void> fetchData() async {
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

    Future<ApiServiceResult> getAveragePM10 = fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM10',
        dataGubun: 'HOUR',
        numOfRows: Duration.hoursPerDay,
      ),
    );
    Future<ApiServiceResult> getAveragePM25 = fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM25',
        dataGubun: 'HOUR',
        numOfRows: Duration.hoursPerDay,
      ),
    );

    await Future.wait([getAveragePM10, getAveragePM25]).then(
      (value) {
        ApiServiceResult averagePM10 = value[0];
        ApiServiceResult averagePM25 = value[1];

        if (averagePM10.header.isSuccessfully &&
            averagePM25.header.isSuccessfully) {
          for (int i = 0; i < Duration.hoursPerDay; i++) {
            MesuringData pm10 = averagePM10.body!.items[i];
            MesuringData pm25 = averagePM25.body!.items[i];

            if (pm10.dataTime == pm25.dataTime) {
              DateTime dateTime = DateTime.parse(pm10.dataTime!);

              _saveMesuringDataOnLocalStorage(dateTime, pm10, pm25);
            }
          }
        }
      },
    );
  }

  static Future<void> _saveMesuringDataOnLocalStorage(
      DateTime dateTime, MesuringData pm10, MesuringData pm25) async {
    Isar? isar = Isar.getInstance('mesuring_data_isar');

    if (isar == null) return;

    FineDustLocalStorage fineDustLocalStorage =
        FineDustLocalStorage(isar: isar);

    MesuringDataIsar mesuringDataIsar = MesuringDataIsar()
      ..date = DateTime.parse(pm10.dataTime!)
      ..pm10 = pm10
      ..pm25 = pm25;

    fineDustLocalStorage.saveData(mesuringDataIsar);
  }
}
