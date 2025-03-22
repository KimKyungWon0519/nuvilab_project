import 'package:go_router/go_router.dart';
import 'package:nuvilab_project/presentation/pages/time_page/time_page.dart';

final class AppRoutes {
  const AppRoutes._();

  static final GoRoute time = GoRoute(
    path: '/time',
    builder: (context, state) => TimePage(),
  );

  static final List<RouteBase> routes = [
    time,
  ];
}
