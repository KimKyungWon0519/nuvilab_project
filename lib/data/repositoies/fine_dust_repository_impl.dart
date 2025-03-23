import 'package:nuvilab_project/core/utils/response_result.dart';
import 'package:nuvilab_project/data/mapper/fine_dust_mapper.dart';
import 'package:nuvilab_project/data/model/get_mesuring_list_param.dart';
import 'package:nuvilab_project/data/model/mesuring_data.dart';
import 'package:nuvilab_project/data/model/mesuring_data_isar.dart';
import 'package:nuvilab_project/data/model/api_service_result.dart';
import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';
import 'package:nuvilab_project/data/service/fine_dust_local_storage.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';

class FineDustRepositoryImpl implements FineDustRepository {
  late final FineDustApiClient _fineDustApiClient;
  late final FineDustLocalStorage _fineDustLocalStorage;

  FineDustRepositoryImpl({
    required FineDustApiClient fineDustApiClient,
    required FineDustLocalStorage fineDustLocalStorage,
  })  : _fineDustApiClient = fineDustApiClient,
        _fineDustLocalStorage = fineDustLocalStorage;

  @override
  Future<ResponseResult<List<MesuringFineDust>>> getFineDustByCities() async {
    Future<ApiServiceResult> getAveragePM10 =
        _fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM10',
        dataGubun: 'HOUR',
        numOfRows: Duration.hoursPerDay,
      ),
    );
    Future<ApiServiceResult> getAveragePM25 =
        _fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM25',
        dataGubun: 'HOUR',
        numOfRows: Duration.hoursPerDay,
      ),
    );

    return await Future.wait([getAveragePM10, getAveragePM25]).then(
      (value) {
        ApiServiceResult averagePM10 = value[0];
        ApiServiceResult averagePM25 = value[1];

        if (averagePM10.header.isSuccessfully &&
            averagePM25.header.isSuccessfully) {
          return ResponseResult.success(
              _transformDataAndSave(averagePM10, averagePM25));
        } else {
          String errorCode =
              _getFineDustByCitiesErrorHandle(averagePM10, averagePM25);

          return ResponseResult.error(errorCode);
        }
      },
    );
  }

  List<MesuringFineDust> _transformDataAndSave(
      ApiServiceResult averagePM10, ApiServiceResult averagePM25) {
    List<MesuringFineDust> mesuringFineDust = [];

    for (int i = 0; i < Duration.hoursPerDay; i++) {
      MesuringData pm10 = averagePM10.body!.items[i];
      MesuringData pm25 = averagePM25.body!.items[i];

      /// 동일 시간일 경우에만 데이터를 병합
      if (pm10.dataTime == pm25.dataTime) {
        DateTime dateTime = DateTime.parse(pm10.dataTime!);

        mesuringFineDust.add(
          MesuringFineDust(
            dateTime: dateTime,
            fineDustByCities: FineDustByCityMapper.toFineDustCities(pm10, pm25),
          ),
        );

        _saveMesuringDataOnLocalStorage(dateTime, pm10, pm25);
      }
    }

    return mesuringFineDust;
  }

  void _saveMesuringDataOnLocalStorage(
      DateTime dateTime, MesuringData pm10, MesuringData pm25) {
    MesuringDataIsar mesuringDataIsar = MesuringDataIsar()
      ..date = DateTime.parse(pm10.dataTime!)
      ..pm10 = pm10
      ..pm25 = pm25;

    _fineDustLocalStorage.saveData(mesuringDataIsar);
  }

  String _getFineDustByCitiesErrorHandle(
    ApiServiceResult averagePM10,
    ApiServiceResult averagePM25,
  ) {
    Set<String> networkErrorCodes = {'-1', '01', '02', '04', '05'};
    Set<String> noDataErrorCodes = {'03'};

    String averagePM10ErrorCode = averagePM10.header.resultCode;
    String averagePM25ErrorCode = averagePM25.header.resultCode;

    if (networkErrorCodes.contains(averagePM10ErrorCode) ||
        networkErrorCodes.contains(averagePM25ErrorCode)) {
      return 'network-error';
    } else if (noDataErrorCodes.contains(averagePM10ErrorCode) ||
        noDataErrorCodes.contains(averagePM25ErrorCode)) {
      return 'no-data';
    }

    return 'unknown';
  }
}
