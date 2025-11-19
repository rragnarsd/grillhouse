import 'package:flutter/material.dart';
import 'package:grill_house/screens/menu/responsive/menu_desktop_screen.dart';
import 'package:grill_house/screens/menu/responsive/menu_mobile_screen.dart';
import 'package:grill_house/screens/menu/responsive/menu_tablet_screen.dart';
import 'package:grill_house/utils/responsive.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const MenuDesktopScreen()
        : Responsive.isTablet(context)
        ? const MenuTabletScreen()
        : const MenuMobileScreen();
  }
}
