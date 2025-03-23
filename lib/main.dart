import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/web.dart';
import 'package:nuvilab_project/core/routes/app_pages.dart';
import 'package:nuvilab_project/data/service/sync_data_service.dart';
import 'package:nuvilab_project/dependency_injection.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  Workmanager().registerPeriodicTask(
    "syncTask",
    "syncData",
    frequency: const Duration(minutes: 15),
  );

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

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    Logger().d('백그라운드 작업 시작');
    await SyncDataService.syncData();
    return Future.value(true);
  });
}
