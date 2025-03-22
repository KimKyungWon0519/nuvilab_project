import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nuvilab_project/core/constants/api_constant.dart';
import 'package:nuvilab_project/core/network/retry_interceptor.dart';
import 'package:nuvilab_project/data/service/fine_dust_api_client.dart';

void main() {
  print('baseURL:$baseURL, serviceKey : $serviceKey');

  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      queryParameters: {'serviceKey': serviceKey, 'returnType': 'json'},
    ),
  );

  FineDustApiClient(dio: dio).getAveragePM10();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
