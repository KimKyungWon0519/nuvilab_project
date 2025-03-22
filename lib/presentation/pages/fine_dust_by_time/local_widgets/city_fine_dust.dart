import 'package:flutter/material.dart';
import 'package:nuvilab_project/domain/model/fine_dust_by_city.dart';

class CityFineDust extends StatelessWidget {
  final FineDustByCity fineDustByCity;

  const CityFineDust({
    super.key,
    required this.fineDustByCity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fineDustByCity.cityName),
      subtitle: Text(
          '미세먼지 : ${fineDustByCity.pm10} ㎍/㎥\n초미세먼지 : ${fineDustByCity.pm25} ㎍/㎥'),
      isThreeLine: true,
    );
  }
}
