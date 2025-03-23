import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:nuvilab_project/presentation/pages/fine_dust_by_time/local_widgets/error_dialog.dart';
import 'package:nuvilab_project/presentation/riverpods/fine_dust_by_time_notifier.dart';

import 'local_widgets/time_fine_dust.dart';

class TimePage extends ConsumerWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<MesuringFineDust>> mesuringDatas =
        ref.watch(fineDustByTimeNotifierProvider);

    if (!mesuringDatas.isLoading && mesuringDatas.hasError) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showDialog(
          context: context,
          builder: (context) => ErrorDialog(error: mesuringDatas.error),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('yyyy-MM-dd').format(DateTime.now()),
        ),
      ),
      body: mesuringDatas.when(
        data: (data) => SingleChildScrollView(
          child: TimeFineDust(mesuringDatas: data),
        ),
        error: (_, __) => SingleChildScrollView(
          child: TimeFineDust(),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
