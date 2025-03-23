import 'package:isar/isar.dart';
import 'package:nuvilab_project/data/model/mesuring_data.dart';

part 'mesuring_data_isar.g.dart';

@Collection()
class MesuringDataIsar {
  late Id id = Isar.autoIncrement;

  @Index(unique: true)
  late DateTime date;

  late MesuringData pm10;
  late MesuringData pm25;
}
