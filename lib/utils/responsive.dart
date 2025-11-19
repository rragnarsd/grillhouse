import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grill_house/utils/routes.dart';
import 'package:grill_house/widgets/navigation/bottom_nav_bar.dart';
import 'package:grill_house/widgets/navigation/header.dart';
import 'package:grill_house/widgets/responsive/desktop_layout.dart';
import 'package:grill_house/widgets/responsive/tablet_layout.dart';

enum ScreenType { mobile, tablet, desktop }

class Responsive {
  static const int mobileScreenSize = 360;
  static const int tabletScreenSize = 768;
  static const int customScreenSize = 1100;
  static const int desktopScreenSize = 1366;

  static ScreenType getScreenType(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    if (width >= desktopScreenSize) {
      return ScreenType.desktop;
    } else if (width >= tabletScreenSize) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= desktopScreenSize;
  }

  static bool isTablet(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return width >= tabletScreenSize && width < desktopScreenSize;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < tabletScreenSize;
  }
}

class ResponsiveLayoutWrapper extends StatelessWidget {
  const ResponsiveLayoutWrapper({
    super.key,
    required this.child,
    required this.currentRoute,
    required this.onRouteChanged,
    this.bottomNav = false,
  });

  final Widget child;
  final AppRoute currentRoute;
  final void Function(AppRoute) onRouteChanged;
  final bool bottomNav;

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = Responsive.getScreenType(context);

    switch (screenType) {
      case ScreenType.desktop:
        return DesktopLayout(
          currentRoute: currentRoute,
          onRouteChanged: onRouteChanged,
          child: Padding(padding: const EdgeInsets.all(24.0), child: child),
        );

      case ScreenType.tablet:
        return TabletLayout(
          widget: Padding(padding: const EdgeInsets.all(16.0), child: child),
          currentRoute: currentRoute,
          onRouteChanged: onRouteChanged,
        );

      case ScreenType.mobile:
        return Scaffold(
          appBar: const AppHeader(),
          body: Padding(padding: const EdgeInsets.all(16.0), child: child),
          bottomNavigationBar: bottomNav
              ? BottomNavBar(
                  currentRoute: currentRoute,
                  onRouteChanged: onRouteChanged,
                )
              : null,
        );
    }
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key, required this.currentRoute});

  final AppRoute currentRoute;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutWrapper(
      currentRoute: currentRoute,
      onRouteChanged: (AppRoute route) => context.go(route.path),
      bottomNav: true,
      child: currentRoute.screen,
    );
  }
}
