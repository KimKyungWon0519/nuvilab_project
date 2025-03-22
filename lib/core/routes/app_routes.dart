import 'package:go_router/go_router.dart';
import 'package:nuvilab_project/presentation/pages/fine_dust_by_time/fine_dust_by_time.dart';

final class AppRoutes {
  const AppRoutes._();

  static final GoRoute fineDustByTime = GoRoute(
    path: '/fine_dust_by_time',
    builder: (context, state) => TimePage(),
  );

  static final List<RouteBase> routes = [
    fineDustByTime,
  ];
}
