import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grill_house/utils/responsive.dart';
import 'package:grill_house/utils/routes.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({
    super.key,
    required this.child,
    required this.navigationShell,
    required this.onRouteChanged,
  });

  final Widget child;
  final StatefulNavigationShell navigationShell;
  final void Function(AppRoute) onRouteChanged;

  @override
  Widget build(BuildContext context) {
    final AppRoute currentRoute = AppRoute.values[navigationShell.currentIndex];

    return ResponsiveLayoutWrapper(
      currentRoute: currentRoute,
      onRouteChanged: onRouteChanged,
      bottomNav: true,
      child: child,
    );
  }
}
