import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grill_house/screens/home/home_screen.dart';
import 'package:grill_house/screens/income/income_screen.dart';
import 'package:grill_house/screens/menu/menu_screen.dart';
import 'package:grill_house/screens/orders/orders_page.dart';
import 'package:grill_house/screens/reservations/reservation_screen.dart';
import 'package:grill_house/utils/responsive.dart';
import 'package:grill_house/widgets/dashboard_shell.dart';

enum AppRoute {
  home(path: '/', screen: HomeScreen()),
  menu(path: '/menu', screen: MenuScreen()),
  orders(path: '/orders', screen: OrdersScreen()),
  reservations(path: '/reservations', screen: ReservationsScreen()),
  income(path: '/income', screen: IncomeScreen());

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
