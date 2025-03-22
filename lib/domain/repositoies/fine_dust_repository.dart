import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';

abstract interface class FineDustRepository {
  Future<List<FineDustByCity>> getFineDustByCities();
}
