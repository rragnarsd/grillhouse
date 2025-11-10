import 'package:dashboard/screens/orders/responsive/orders_desktop_screen.dart';
import 'package:dashboard/screens/orders/responsive/orders_mobile_screen.dart';
import 'package:dashboard/screens/orders/responsive/orders_tablet_screen.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)
        ? const OrdersDesktopScreen()
        : Responsive.isTablet(context)
        ? const OrdersTabletScreen()
        : const OrdersMobileScreen();
  }
}
