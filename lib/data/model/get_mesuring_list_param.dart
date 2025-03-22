import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_mesuring_list_param.freezed.dart';
part 'get_mesuring_list_param.g.dart';

@freezed
abstract class GetMesuringListParam with _$GetMesuringListParam {
  const factory GetMesuringListParam({
    int? numOfRows,
    int? pageNo,
    required String itemCode,
    required String dataGubun,
    String? searchCondition,
  }) = _GetMesuringListParam;

  factory GetMesuringListParam.fromJson(Map<String, dynamic> json) =>
      _$GetMesuringListParamFromJson(json);
}
