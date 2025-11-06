import 'package:dashboard/widgets/desktop_body.dart';
import 'package:dashboard/widgets/desktop_layout.dart';
import 'package:dashboard/widgets/mobile_body.dart';
import 'package:dashboard/widgets/mobile_layout.dart';
import 'package:dashboard/widgets/tablet_body.dart';
import 'package:dashboard/widgets/tablet_layout.dart';
import 'package:flutter/material.dart';

class Responsive {
  static const int desktopScreenSize = 1366;
  static const int tabletScreenSize = 768;
  static const int mobileScreenSize = 360;
  static const int customScreenSize = 1100;

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopScreenSize;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletScreenSize &&
        MediaQuery.of(context).size.width < desktopScreenSize;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletScreenSize;
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        if (constraints.maxWidth >= Responsive.desktopScreenSize) {
          return const DesktopLayout(widget: DesktopBody());
        } else if (constraints.maxWidth >= Responsive.tabletScreenSize) {
          return TabletLayout(widget: const TabletBody());
        } else {
          return MobileLayout(widget: const MobileBody());
        }
      },
    );
  }
}
