import 'package:go_router/go_router.dart';
import 'package:nuvilab_project/presentation/pages/fine_dust_by_time/fine_dust_by_time.dart';

class AppRoutes {
  const AppRoutes._();

  /// 메인 페이지 라우터
  static final GoRoute fineDustByTime = GoRoute(
    path: '/fine_dust_by_time',
    builder: (context, state) => TimePage(),
  );

  static final List<RouteBase> routes = [
    fineDustByTime,
  ];
}
