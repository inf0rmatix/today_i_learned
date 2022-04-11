import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/all_learnings/views/all_learnings_page.dart';
import 'package:today_i_learned/src/core/router/app_routes.dart';
import 'package:today_i_learned/src/create_learning/create_learning.dart';
import 'package:today_i_learned/src/dashboard/dashboard.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static late GoRouter _router;

  // TODO(1nf0rmatix): add authentication state listening to redirect.
  static void initialize() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutes.dashboard,
          builder: (_, __) => const DashboardPage(),
          routes: [
            GoRoute(
              path: 'create-learning',
              name: AppRoutes.createLearning,
              builder: (_, __) => const CreateLearningPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/all-learnings',
          name: AppRoutes.allLearnings,
          builder: (_, __) => const AllLearningsPage(),
        ),
      ],
    );
  }
}
