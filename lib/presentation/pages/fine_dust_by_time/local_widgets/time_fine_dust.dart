import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust.dart';
import 'package:nuvilab_project/domain/model/mesuring_fine_dust_list.dart';

import 'city_fine_dust_listview.dart';

class TimeFineDust extends HookConsumerWidget {
  final List<MesuringFineDust> mesuringDatas;

  const TimeFineDust({
    super.key,
    this.mesuringDatas = const [],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileStateList =
        List.generate(Duration.hoursPerDay, (_) => useState(false));

    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        tileStateList[panelIndex].value = !isExpanded;
      },
      children: List.generate(
        Duration.hoursPerDay,
        (index) {
          List<FineDustByCity> fineDustByCities =
              mesuringDatas.getFineDustByCities(_convertDateTime(index));

          return ExpansionPanel(
            headerBuilder: (context, isExpanded) => ListTile(
              title: Text(
                '${NumberFormat('00').format(index)}시',
              ),
            ),
            body: fineDustByCities.isNotEmpty
                ? CityFineDustListview(fineDustByCities: fineDustByCities)
                : Text('데이터가 없습니다.'),
            isExpanded: tileStateList[index].value,
            canTapOnHeader: true,
          );
        },
      ),
    );
  }

  DateTime _convertDateTime(int sourceHour) {
    return DateTime.now().copyWith(
      hour: sourceHour,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
  }
}
