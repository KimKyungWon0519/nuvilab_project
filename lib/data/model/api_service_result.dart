import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuvilab_project/data/model/mesuring_data.dart';

part 'api_service_result.freezed.dart';
part 'api_service_result.g.dart';

@freezed
abstract class ApiServiceResult with _$ApiServiceResult {
  const factory ApiServiceResult({
    required Header header,
    required Body? body,
  }) = _ApiServiceResult;

  factory ApiServiceResult.fromJson(Map<String, Object?> json) =>
      _$ApiServiceResultFromJson(json);
}

@freezed
abstract class Header with _$Header {
  const Header._();

  const factory Header({
    required String resultMsg,
    required String resultCode,
  }) = _Header;

  factory Header.fromJson(Map<String, Object?> json) => _$HeaderFromJson(json);

  bool get isSuccessfully => resultCode == '00';
}

@freezed
abstract class Body with _$Body {
  const factory Body({
    required int totalCount,
    required List<MesuringData> items,
    required int pageNo,
    required int numOfRows,
  }) = _Body;

  factory Body.fromJson(Map<String, Object?> json) => _$BodyFromJson(json);
}
