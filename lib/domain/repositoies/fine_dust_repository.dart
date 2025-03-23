import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';

abstract class FineDustRepository {
  Future<List<MesuringFineDust>> getFineDustByCities();
}
