import 'package:get_it/get_it.dart';
import 'package:nuvilab_project/core/utils/response_result.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_local_storage_repository.dart';
import 'package:nuvilab_project/domain/repositoies/fine_dust_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fine_dust_by_time_notifier.g.dart';

@riverpod
class FineDustByTimeNotifier extends _$FineDustByTimeNotifier {
  late final FineDustRepository _fineDustRepository;
  late final FineDustLocalStorageRepository _fineDustLocalStorageRepository;

  FineDustByTimeNotifier({
    FineDustRepository? fineDustRepository,
    FineDustLocalStorageRepository? fineDustLocalStorageRepository,
  })  : _fineDustRepository =
            fineDustRepository ?? GetIt.I<FineDustRepository>(),
        _fineDustLocalStorageRepository = fineDustLocalStorageRepository ??
            GetIt.I<FineDustLocalStorageRepository>();

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

  void getDataFromLocalStorage() async {
    state = AsyncLoading();

    try {
      List<MesuringFineDust> mesuringFineDusts =
          await _fineDustLocalStorageRepository.getFineDustByCities();

      state = AsyncData(mesuringFineDusts);
    } catch (e) {
      state = AsyncError('unknown', StackTrace.current);
    }
  }
}
