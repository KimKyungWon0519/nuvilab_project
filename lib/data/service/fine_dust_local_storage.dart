import 'package:isar/isar.dart';
import 'package:logger/web.dart';
import 'package:nuvilab_project/data/model/mesuring_data_isar.dart';

class FineDustLocalStorage {
  late final Isar _isar;

  FineDustLocalStorage({required Isar isar}) : _isar = isar;

  String get path => _isar.path!;

  Future<void> saveData(MesuringDataIsar mesuringDataIsar) async {
    try {
      await _isar.writeTxn(() => _isar.mesuringDataIsars.put(mesuringDataIsar));

      Logger().i('FineDustLocalStorage.saveData - $mesuringDataIsar');
    } catch (e, stackTrace) {
      Logger().e(
        'FineDustLocalStorage.saveData',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  List<MesuringDataIsar> getData(DateTime dateTime) {
    return _isar.mesuringDataIsars.where().dateEqualTo(dateTime).findAllSync();
  }
}
