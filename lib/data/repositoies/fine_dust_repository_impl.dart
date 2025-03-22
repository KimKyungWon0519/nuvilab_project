import 'package:nuvilab_project/data/model/get_mesuring_list_param.dart';
import 'package:nuvilab_project/data/model/response_result.dart';
import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';
import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';

class FineDustRepositoryImpl implements FineDustRepository {
  late final FineDustApiClient _fineDustApiClient;

  FineDustRepositoryImpl({
    required FineDustApiClient fineDustApiClient,
  }) : _fineDustApiClient = fineDustApiClient;

  @override
  Future<List<FineDustByCity>> getFineDustByCities() async {
    Future<ResponseResult> getAveragePM10 = _fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM10',
        dataGubun: 'HOUR',
        numOfRows: 24,
      ),
    );
    Future<ResponseResult> getAveragePM25 = _fineDustApiClient.getMesuringList(
      GetMesuringListParam(
        itemCode: 'PM25',
        dataGubun: 'HOUR',
        numOfRows: 24,
      ),
    );

    await Future.wait([getAveragePM10, getAveragePM25]).then(
      (value) {
        ResponseResult averagePM10 = value[0];
        ResponseResult averagePM25 = value[1];

        print(averagePM10.header);
      },
    );

    return [];
  }
}
