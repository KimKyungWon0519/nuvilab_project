import 'package:nuvilab_project/core/utils/response_result.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';

abstract class FineDustRepository {
  /// 미세먼지/초미세먼지 데이터를 서버로 부터 가져옴
  Future<ResponseResult<List<MesuringFineDust>>> getFineDustByCities();
}
