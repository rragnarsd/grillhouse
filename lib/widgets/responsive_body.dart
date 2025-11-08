import 'package:dashboard/pages/home/home_screen.dart';
import 'package:dashboard/pages/orders/orders_page.dart';
import 'package:dashboard/pages/products/product_page.dart';
import 'package:dashboard/pages/profile/profile_page.dart';
import 'package:dashboard/pages/settings/settings_page.dart';
import 'package:dashboard/utils/routes.dart';
import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  const ResponsiveBody({
    super.key,
    required this.currentRoute,
    required this.padding,
  });

  final AppRoute currentRoute;
  final EdgeInsets padding;

  Widget _getScreenForRoute(AppRoute route) {
    switch (route) {
      case AppRoute.home:
        return const HomeScreen();
      case AppRoute.settings:
        return const SettingsScreen();
      case AppRoute.profile:
        return const ProfileScreen();
      case AppRoute.product:
        return const ProductScreen();
      case AppRoute.orders:
        return const OrdersScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: _getScreenForRoute(currentRoute));
  }
}
