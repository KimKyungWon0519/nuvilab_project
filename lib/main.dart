import 'package:flutter/material.dart';
import 'package:nuvilab_project/core/routes/app_pages.dart';
import 'package:nuvilab_project/dependency_injection.dart';

void main() {
  initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppPages.routeConfig,
    );
  }
}
