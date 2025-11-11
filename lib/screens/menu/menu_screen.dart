import 'package:dashboard/screens/menu/menu_desktop_screen.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const MenuDesktopScreen()
        : Responsive.isTablet(context)
        ? const Text('Menu Tablet')
        : const Text('Menu Mobile');
  }
}
