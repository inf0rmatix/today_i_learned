import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/app.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Widget? child;
  final String currentRoute;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentRoute,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: child ?? Container()),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    blurRadius: AppSpacing.S,
                    color: Colors.black45,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Material(
                  child: Row(
                    children: [
                      CustomBottomNavigationBarElement(
                        icon: Icons.dashboard_rounded,
                        title: 'Dashboard',
                        onTap: () => AppRouter.router.goNamed(AppRoutes.dashboard),
                        isActive: currentRoute.startsWith('/dashboard'),
                      ),
                      const SizedBox(width: AppSpacing.XL),
                      CustomBottomNavigationBarElement(
                        icon: Icons.list_rounded,
                        title: 'Learnings',
                        onTap: () => AppRouter.router.goNamed(AppRoutes.learnings),
                        isActive: currentRoute.startsWith('/learnings'),
                      ),
                      const SizedBox(width: AppSpacing.XL),
                      CustomBottomNavigationBarElement(
                        icon: Icons.emoji_events_rounded,
                        title: 'Goals',
                        onTap: () => AppRouter.router.goNamed(AppRoutes.goals),
                        isActive: currentRoute.startsWith('/goals'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: prefer-single-widget-per-file
class CustomBottomNavigationBarElement extends StatelessWidget {
  static const _animationDuration = Duration(milliseconds: 400);
  static const _animationCurve = Curves.easeInOut;

  final IconData icon;
  final String title;
  final void Function() onTap;
  final bool isActive;

  const CustomBottomNavigationBarElement({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.L,
            bottom: AppSpacing.M,
          ),
          child: AnimatedTheme(
            curve: _animationCurve,
            duration: _animationDuration,
            data: theme.copyWith(
              iconTheme: IconThemeData(
                color: isActive ? theme.colorScheme.secondary : theme.iconTheme.color,
              ),
            ),
            child: Column(
              children: [
                Icon(icon),
                AnimatedDefaultTextStyle(
                  curve: _animationCurve,
                  duration: _animationDuration,
                  style: TextStyle(
                    color: isActive ? theme.colorScheme.secondary : AppColors.seashell,
                  ),
                  child: Text(title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
