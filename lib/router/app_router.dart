import 'package:go_router/go_router.dart';
import 'package:today_i_learned/all_learnings/all_learnings.dart';
import 'package:today_i_learned/dashboard/dashboard.dart';
import 'package:today_i_learned/router/app_routes.dart';

class AppRouter {
  static final router = GoRouter(
    // TODO(1nf0rmatix): implement startup page, https://app.clickup.com/t/2389vgx.
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/dashboard',
        name: AppRoutes.dashboard,
        builder: (_, __) => const DashboardPage(),
      ),
      GoRoute(
        path: '/all-learnings',
        name: AppRoutes.allLearnings,
        builder: (_, __) => const AllLearningsPage(),
      ),
    ],
  );
}
