import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'mesuring_data.g.dart';
part 'mesuring_data.freezed.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class MesuringData with _$MesuringData {
  const MesuringData._();

  const factory MesuringData({
    String? daegu,
    String? chungnam,
    String? incheon,
    String? daejeon,
    String? gyeongbuk,
    String? sejong,
    String? gwangju,
    String? jeonbuk,
    String? gangwon,
    String? ulsan,
    String? jeonnam,
    String? seoul,
    String? busan,
    String? jeju,
    String? chungbuk,
    String? gyeongnam,
    String? dataTime,
    String? dataGubun,
    String? gyeonggi,
    String? itemCode,
  }) = _MesuringData;

  factory MesuringData.fromJson(Map<String, Object?> json) =>
      _$MesuringDataFromJson(json);
}
