import 'package:dashboard/screens/income/responsive/income_desktop_screen.dart';
import 'package:dashboard/screens/income/responsive/income_mobile_screen.dart';
import 'package:dashboard/screens/income/responsive/income_tablet_screen.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const IncomeDesktopScreen()
        : Responsive.isTablet(context)
        ? const IncomeTabletScreen()
        : const IncomeMobileScreen();
  }
}
