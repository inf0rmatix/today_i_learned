import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/app.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final ThemeData theme;
  final Widget? child;

  const CustomBottomNavigationBar({
    Key? key,
    required this.theme,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: child ?? Container()),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
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
                        ),
                        const SizedBox(width: AppSpacing.XL),
                        CustomBottomNavigationBarElement(
                          icon: Icons.list_rounded,
                          title: 'Learnings',
                          onTap: () => AppRouter.router.goNamed(AppRoutes.learnings),
                        ),
                        const SizedBox(width: AppSpacing.XL),
                        CustomBottomNavigationBarElement(
                          icon: Icons.emoji_events_rounded,
                          title: 'Goals',
                          onTap: () => AppRouter.router.goNamed(AppRoutes.goals),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class CustomBottomNavigationBarElement extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;

  const CustomBottomNavigationBarElement({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.L,
            bottom: AppSpacing.M,
          ),
          child: Column(
            children: [
              Icon(icon),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
