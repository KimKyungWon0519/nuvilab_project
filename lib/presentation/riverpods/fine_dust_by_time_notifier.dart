import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fine_dust_by_time_notifier.g.dart';

@riverpod
class FineDustByTimeNotifier extends _$FineDustByTimeNotifier {
  @override
  List<MesuringFineDust> build() {
    return [];
  }
}
