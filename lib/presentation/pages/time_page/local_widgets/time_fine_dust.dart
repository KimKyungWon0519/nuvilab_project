import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import 'city_fine_dust.dart';

class TimeFineDust extends HookWidget {
  const TimeFineDust({super.key});

  @override
  Widget build(BuildContext context) {
    final tileStateList =
        List.generate(Duration.hoursPerDay, (_) => useState(false));

    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        tileStateList[panelIndex].value = isExpanded;
      },
      children: List.generate(
        Duration.hoursPerDay,
        (index) => ExpansionPanel(
          headerBuilder: (context, isExpanded) => ListTile(
            title: Text(
              '${NumberFormat('00').format(index)}시',
            ),
          ),
          body: CityFineDust(cityName: '지역이름', pm10: 0, pm25: 0),
          isExpanded: tileStateList[index].value,
          canTapOnHeader: true,
        ),
      ),
    );
  }
}
