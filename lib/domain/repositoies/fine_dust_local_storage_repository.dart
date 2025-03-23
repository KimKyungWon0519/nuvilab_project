import 'package:nuvilab_project/core/utils/response_result.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';

abstract class FineDustLocalStorageRepository {
  /// 시도별 미세먼지/초미세먼지 로컬 저장소로 부터 데이터를 가져옴
  Future<List<MesuringFineDust>> getFineDustByCities();
}
