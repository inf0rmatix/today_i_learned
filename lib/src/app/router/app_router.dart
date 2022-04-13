import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/app/router/app_routes.dart';
import 'package:today_i_learned/src/dashboard/dashboard.dart';
import 'package:today_i_learned/src/goals/views/create_goal_page.dart';
import 'package:today_i_learned/src/goals/views/goals_page.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static late GoRouter _router;

  // TODO(1nf0rmatix): add authentication state listening to redirect.
  static void initialize() {
    _router = GoRouter(
      initialLocation: '/learnings/details/1',
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutes.dashboard,
          builder: (_, __) => const DashboardPage(),
        ),
        GoRoute(
          path: '/learnings',
          name: AppRoutes.learnings,
          builder: (_, __) => const LearningsPage(),
          routes: [
            GoRoute(
              path: 'details/:uid',
              name: AppRoutes.learningDetails,
              builder: (_, routerState) => LearningDetailsPage(uid: routerState.params['uid'].toString()),
            ),
            GoRoute(
              path: 'create',
              name: AppRoutes.createLearning,
              builder: (_, __) => const CreateLearningPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/goals',
          name: AppRoutes.goals,
          builder: (_, __) => const GoalsPage(),
          routes: [
            GoRoute(
              path: 'create',
              name: AppRoutes.createGoal,
              builder: (_, __) => const CreateGoalPage(),
            ),
          ],
        ),
      ],
    );
  }
}