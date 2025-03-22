import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';

extension MesuringFineDustList on List<MesuringFineDust> {
  List<FineDustByCity> getFineDustByCities(DateTime sourceTime) {
    try {
      return singleWhere((element) => element.dateTime == sourceTime)
          .fineDustByCities;
    } catch (_) {
      return [];
    }
  }
}
