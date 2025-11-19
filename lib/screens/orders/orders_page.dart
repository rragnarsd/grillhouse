import 'package:flutter/material.dart';
import 'package:grill_house/screens/orders/responsive/orders_desktop_screen.dart';
import 'package:grill_house/screens/orders/responsive/orders_mobile_screen.dart';
import 'package:grill_house/screens/orders/responsive/orders_tablet_screen.dart';
import 'package:grill_house/utils/responsive.dart';

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
