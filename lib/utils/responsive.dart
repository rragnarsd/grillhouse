import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/responsive/desktop_layout.dart';
import 'package:dashboard/widgets/responsive/mobile_layout.dart';
import 'package:dashboard/widgets/responsive/tablet_layout.dart';
import 'package:dashboard/widgets/responsive_body.dart';
import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

class Responsive {
  static const int mobileScreenSize = 360;
  static const int tabletScreenSize = 768;
  static const int customScreenSize = 1100;
  static const int desktopScreenSize = 1366;

  static ScreenType getScreenType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

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

class ResponsiveDesignScreen extends StatefulWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  State<ResponsiveDesignScreen> createState() => _ResponsiveDesignScreenState();
}

class _ResponsiveDesignScreenState extends State<ResponsiveDesignScreen> {
  AppRoute _currentRoute = AppRoute.home;

  void _onRouteChanged(AppRoute route) {
    setState(() => _currentRoute = route);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        if (constraints.maxWidth >= Responsive.desktopScreenSize) {
          return DesktopLayout(
            widget: ResponsiveBody(
              currentRoute: _currentRoute,
              padding: const EdgeInsets.all(24),
            ),
            currentRoute: _currentRoute,
            onRouteChanged: _onRouteChanged,
          );
        } else if (constraints.maxWidth >= Responsive.tabletScreenSize) {
          return TabletLayout(
            widget: ResponsiveBody(
              currentRoute: _currentRoute,
              padding: const EdgeInsets.all(16),
            ),
            currentRoute: _currentRoute,
            onRouteChanged: _onRouteChanged,
          );
        } else {
          return MobileLayout(
            widget: ResponsiveBody(
              currentRoute: _currentRoute,
              padding: const EdgeInsets.all(16),
            ),
            currentRoute: _currentRoute,
            onRouteChanged: _onRouteChanged,
          );
        }
      },
    );
  }
}
