import 'package:nuvilab_project/data/mapper/fine_dust_mapper.dart';
import 'package:nuvilab_project/data/model/get_mesuring_list_param.dart';
import 'package:nuvilab_project/data/model/mesuring_data.dart';
import 'package:nuvilab_project/data/model/mesuring_data_isar.dart';
import 'package:nuvilab_project/data/model/response_result.dart';
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
  Future<List<MesuringFineDust>> getFineDustByCities() async {
    List<MesuringFineDust> mesuringFineDust = [];

    Future<ResponseResult> getAveragePM10 = _fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM10',
        dataGubun: 'HOUR',
        numOfRows: Duration.hoursPerDay,
      ),
    );
    Future<ResponseResult> getAveragePM25 = _fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM25',
        dataGubun: 'HOUR',
        numOfRows: Duration.hoursPerDay,
      ),
    );

    await Future.wait([getAveragePM10, getAveragePM25]).then(
      (value) {
        ResponseResult averagePM10 = value[0];
        ResponseResult averagePM25 = value[1];

        if (averagePM10.header.isSuccessfully &&
            averagePM25.header.isSuccessfully) {
          for (int i = 0; i < Duration.hoursPerDay; i++) {
            MesuringData pm10 = averagePM10.body!.items[i];
            MesuringData pm25 = averagePM25.body!.items[i];

            if (pm10.dataTime == pm25.dataTime) {
              DateTime dateTime = DateTime.parse(pm10.dataTime!);

              mesuringFineDust.add(
                MesuringFineDust(
                  dateTime: dateTime,
                  fineDustByCities:
                      FineDustByCityMapper.toFineDustCities(pm10, pm25),
                ),
              );

              _saveMesuringDataOnLocalStorage(dateTime, pm10, pm25);
            }
          }
        }
      },
    );

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
}
