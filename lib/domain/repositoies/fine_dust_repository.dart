import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';

abstract interface class FineDustRepository {
  Future<List<MesuringFineDust>> getFineDustByCities();
}
