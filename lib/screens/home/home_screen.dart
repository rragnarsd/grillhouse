import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/responsive/home_desktop_screen.dart';
import 'package:grill_house/screens/home/responsive/home_mobile_screen.dart';
import 'package:grill_house/screens/home/responsive/home_tablet_screen.dart';
import 'package:grill_house/utils/responsive.dart';

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
