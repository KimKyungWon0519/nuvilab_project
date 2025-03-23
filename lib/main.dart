import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nuvilab_project/core/routes/app_pages.dart';
import 'package:nuvilab_project/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: AppPages.routeConfig,
    );
  }
}
