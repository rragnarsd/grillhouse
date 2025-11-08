import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigaton/bottom_nav_bar.dart';
import 'package:dashboard/widgets/navigaton/header.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
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
      appBar: const AppHeader(),
      body: widget ?? const SizedBox(),
      bottomNavigationBar: BottomNavBar(
        currentRoute: currentRoute,
        onRouteChanged: onRouteChanged,
      ),
    );
  }
}
