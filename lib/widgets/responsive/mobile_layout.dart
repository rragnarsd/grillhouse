import 'package:flutter/material.dart';
import 'package:grill_house/utils/routes.dart';
import 'package:grill_house/widgets/navigation/bottom_nav_bar.dart';
import 'package:grill_house/widgets/navigation/header.dart';

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
