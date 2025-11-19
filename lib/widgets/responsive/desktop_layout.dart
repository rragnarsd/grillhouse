import 'package:flutter/material.dart';
import 'package:grill_house/utils/routes.dart';
import 'package:grill_house/widgets/navigation/header.dart';
import 'package:grill_house/widgets/navigation/sidebar.dart';

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
