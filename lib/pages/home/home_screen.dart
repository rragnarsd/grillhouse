import 'package:dashboard/pages/home/responsive/home_desktop_screen.dart';
import 'package:dashboard/pages/home/responsive/home_mobile_screen.dart';
import 'package:dashboard/pages/home/responsive/home_tablet_screen.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const HomeDesktopScreen()
        : Responsive.isTablet(context)
        ? const HomeTabletScreen()
        : const HomeMobileScreen();
  }
}
