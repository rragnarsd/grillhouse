import 'package:dashboard/screens/home/home_screen.dart';
import 'package:dashboard/screens/menu/menu_screen.dart';
import 'package:dashboard/screens/orders/orders_page.dart';
import 'package:dashboard/screens/profile/profile_page.dart';
import 'package:dashboard/screens/settings/settings_page.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/widgets/dashboard_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home(path: '/', screen: HomeScreen()),
  menu(path: '/menu', screen: MenuScreen()),
  orders(path: '/orders', screen: OrdersScreen()),
  settings(path: '/settings', screen: SettingsScreen()),
  profile(path: '/profile', screen: ProfileScreen());

  final String path;
  final Widget screen;

  const AppRoute({required this.path, required this.screen});
}

final GoRouter router = GoRouter(
  initialLocation: AppRoute.home.path,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            final AppRoute currentRoute =
                AppRoute.values[navigationShell.currentIndex];

            return DashboardShell(
              navigationShell: navigationShell,
              onRouteChanged: (AppRoute route) {
                final int index = AppRoute.values.indexOf(route);
                navigationShell.goBranch(index);
              },
              child: currentRoute.screen,
            );
          },
      branches: AppRoute.values.map((AppRoute route) {
        return StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: route.path,
              builder: (_, __) => ResponsiveDesignScreen(currentRoute: route),
            ),
          ],
        );
      }).toList(),
    ),
  ],
);
