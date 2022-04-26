import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/views/categories_page.dart';
import 'package:today_i_learned/src/categories/views/category_page.dart';
import 'package:today_i_learned/src/dashboard/dashboard.dart';
import 'package:today_i_learned/src/goals/views/create_goal_page.dart';
import 'package:today_i_learned/src/goals/views/goals_page.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';
import 'package:today_i_learned/src/startup/startup.dart';

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;

  static late GoRouter _router;

  // TODO(inf0rmatix): add authentication state listening to redirect.
  // ignore: long-method
  static void initialize() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutes.startup,
          builder: (_, __) => const StartupPage(),
        ),
        GoRoute(
          path: '/dashboard',
          name: AppRoutes.dashboard,
          builder: (_, __) => const DashboardPage(),
        ),
        GoRoute(
          path: '/learnings',
          name: AppRoutes.learnings,
          builder: (_, __) => const LearningsPage(),
          routes: [
            GoRoute(
              path: 'details/:learningUid',
              name: AppRoutes.learningDetails,
              builder: (_, routerState) => LearningDetailsPage(
                uid: routerState.params['learningUid'].toString(),
              ),
            ),
            GoRoute(
              path: 'create',
              name: AppRoutes.createLearning,
              builder: (_, __) => const EditLearningPage(),
            ),
            GoRoute(
              path: 'edit/:learningUid',
              name: AppRoutes.editLearning,
              builder: (_, routerState) => EditLearningPage(
                learningUid: routerState.params['learningUid'].toString(),
              ),
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
        GoRoute(
          path: '/categories',
          name: AppRoutes.categories,
          builder: (_, __) => const CategoriesPage(),
          routes: [
            GoRoute(
              path: 'details/:categoryUid',
              name: AppRoutes.categoryDetails,
              builder: (_, routerState) => CategoryPage(categoryUid: routerState.params['categoryUid']!),
            ),
          ],
        ),
      ],
      navigatorBuilder: (context, routerState, child) => CustomBottomNavigationBar(
        currentRoute: routerState.location,
        child: child,
      ),
    );
  }
}
