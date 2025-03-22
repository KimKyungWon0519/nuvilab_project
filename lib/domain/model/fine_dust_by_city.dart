import 'package:freezed_annotation/freezed_annotation.dart';

part 'fine_dust_by_city.freezed.dart';

@freezed
abstract class FineDustByCity with _$FineDustByCity {
  const factory FineDustByCity({
    required String cityName,
    required double pm10,
    required double pm25,
  }) = _FineDustByCity;
}
