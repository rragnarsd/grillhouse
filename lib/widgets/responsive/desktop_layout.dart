import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigation/header.dart';
import 'package:dashboard/widgets/navigation/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    required this.child,
    required this.currentRoute,
    required this.onRouteChanged,
  });

  final Widget child;
  final AppRoute currentRoute;
  final void Function(AppRoute) onRouteChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          SideBar(currentRoute: currentRoute, onRouteChanged: onRouteChanged),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AppHeader(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
