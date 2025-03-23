import 'package:flutter/material.dart';
import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';

import 'city_fine_dust.dart';

class CityFineDustListview extends StatelessWidget {
  final List<FineDustByCity> fineDustByCities;

  const CityFineDustListview({
    super.key,
    required this.fineDustByCities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: fineDustByCities
          .map(
            (e) => CityFineDust(fineDustByCity: e),
          )
          .toList(),
    );
  }
}
