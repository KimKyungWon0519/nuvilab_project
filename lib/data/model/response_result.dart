import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nuvilab_project/data/model/mesuring_data.dart';

part 'response_result.freezed.dart';
part 'response_result.g.dart';

@freezed
abstract class ResponseResult with _$ResponseResult {
  const factory ResponseResult({
    required Header header,
    required Body? body,
  }) = _ResponseResult;

  factory ResponseResult.fromJson(Map<String, Object?> json) =>
      _$ResponseResultFromJson(json);
}

@freezed
abstract class Header with _$Header {
  const factory Header({
    required String resultMsg,
    required String resultCode,
  }) = _Header;

  factory Header.fromJson(Map<String, Object?> json) => _$HeaderFromJson(json);
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
