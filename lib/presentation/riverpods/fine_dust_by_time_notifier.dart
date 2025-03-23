import 'package:get_it/get_it.dart';
import 'package:nuvilab_project/core/utils/response_result.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fine_dust_by_time_notifier.g.dart';

@riverpod
class FineDustByTimeNotifier extends _$FineDustByTimeNotifier {
  late final FineDustRepository _fineDustRepository;

  FineDustByTimeNotifier({
    FineDustRepository? fineDustRepository,
  }) : _fineDustRepository =
            fineDustRepository ?? GetIt.I<FineDustRepository>();

  @override
  FutureOr<List<MesuringFineDust>> build() async {
    ResponseResult<List<MesuringFineDust>> mesuringDataResponse =
        await _fineDustRepository.getFineDustByCities();

    if (mesuringDataResponse.isSuccess) {
      return mesuringDataResponse.data!;
    } else {
      return Future.error(mesuringDataResponse.error!);
    }
  }
}
