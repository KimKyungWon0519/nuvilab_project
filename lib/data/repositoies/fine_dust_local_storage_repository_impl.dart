import 'package:nuvilab_project/data/mapper/fine_dust_mapper.dart';
import 'package:nuvilab_project/data/model/mesuring_data_isar.dart';
import 'package:nuvilab_project/data/service/fine_dust_local_storage.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_local_storage_repository.dart';

class FineDustLocalStorageRepositoryImpl
    implements FineDustLocalStorageRepository {
  late final FineDustLocalStorage _fineDustLocalStorage;

  FineDustLocalStorageRepositoryImpl({
    required FineDustLocalStorage fineDustLocalStorage,
  }) : _fineDustLocalStorage = fineDustLocalStorage;

  @override
  Future<List<MesuringFineDust>> getFineDustByCities() async {
    return _fineDustLocalStorage
        .getData(Duration.hoursPerDay)
        .then((value) => _transformDataAndSave(value));
  }

  List<MesuringFineDust> _transformDataAndSave(
      List<MesuringDataIsar> mesuringDataIsars) {
    List<MesuringFineDust> mesuringFineDust = [];

    for (int i = 0; i < mesuringDataIsars.length; i++) {
      MesuringDataIsar mesuringDataIsar = mesuringDataIsars[i];

      mesuringFineDust.add(
        MesuringFineDust(
          dateTime: mesuringDataIsar.date,
          fineDustByCities: FineDustByCityMapper.toFineDustCities(
              mesuringDataIsar.pm10, mesuringDataIsar.pm25),
        ),
      );
    }

    return mesuringFineDust;
  }
}
