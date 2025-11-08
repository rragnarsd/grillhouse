import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigaton/header.dart';
import 'package:dashboard/widgets/navigaton/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    this.widget,
    required this.currentRoute,
    required this.onRouteChanged,
  });

  final Widget? widget;
  final AppRoute currentRoute;
  final Function(AppRoute) onRouteChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: SideBar(
              currentRoute: currentRoute,
              onRouteChanged: onRouteChanged,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                const AppHeader(),
                Expanded(child: widget ?? const SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
