import 'package:freezed_annotation/freezed_annotation.dart';

part 'mesuring_data.g.dart';
part 'mesuring_data.freezed.dart';

@freezed
abstract class MesuringData with _$MesuringData {
  const factory MesuringData({
    required String daegu,
    required String chungnam,
    required String incheon,
    required String daejeon,
    required String gyeongbuk,
    required String sejong,
    required String gwangju,
    required String jeonbuk,
    required String gangwon,
    required String ulsan,
    required String jeonnam,
    required String seoul,
    required String busan,
    required String jeju,
    required String chungbuk,
    required String gyeongnam,
    required String dataTime,
    required String dataGubun,
    required String gyeonggi,
    required String itemCode,
  }) = _MesuringData;

  factory MesuringData.fromJson(Map<String, Object?> json) =>
      _$MesuringDataFromJson(json);
}
