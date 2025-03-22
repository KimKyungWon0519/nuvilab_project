import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';

part 'mesuring_fine_dust.freezed.dart';

@freezed
abstract class MesuringFineDust with _$MesuringFineDust {
  const factory MesuringFineDust({
    required DateTime dateTime,
    required List<FineDustByCity> fineDustByCities,
  }) = _MesuringFineDust;
}
