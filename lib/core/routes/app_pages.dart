import 'package:go_router/go_router.dart';
import 'package:nuvilab_project/core/routes/app_routes.dart';

final class AppPages {
  const AppPages._();

  static final String _initialLocation = '';

  static final GoRouter routeConfig = GoRouter(
    routes: AppRoutes.routes,
    initialLocation: _initialLocation,
  );
}
