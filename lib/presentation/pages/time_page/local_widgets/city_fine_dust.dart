import 'package:flutter/material.dart';

class CityFineDust extends StatelessWidget {
  final String cityName;
  final double pm10;
  final double pm25;

  const CityFineDust({
    super.key,
    required this.cityName,
    required this.pm10,
    required this.pm25,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cityName),
      subtitle: Text('미세먼지 : $pm10 ㎍/㎥\n초미세먼지 : $pm25 ㎍/㎥'),
      isThreeLine: true,
    );
  }
}
