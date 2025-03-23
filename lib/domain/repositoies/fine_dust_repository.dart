import 'package:nuvilab_project/core/utils/response_result.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';

abstract class FineDustRepository {
  Future<ResponseResult<List<MesuringFineDust>>> getFineDustByCities();
}
