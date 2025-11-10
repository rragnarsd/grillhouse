import 'package:dashboard/utils/routes.dart';
import 'package:flutter/material.dart';

class SidebarItem {
  final String title;
  final IconData icon;
  final IconData? activeIcon;
  final AppRoute route;

  SidebarItem({
    required this.title,
    required this.icon,
    required this.route,
    this.activeIcon,
  });
}

final List<SidebarItem> sidebarItems = <SidebarItem>[
  SidebarItem(
    title: 'Home',
    icon: Icons.home_outlined,
    activeIcon: Icons.home,
    route: AppRoute.home,
  ),
  SidebarItem(
    title: 'Menu',
    icon: Icons.shopping_bag_outlined,
    activeIcon: Icons.shopping_bag,
    route: AppRoute.menu,
  ),
  SidebarItem(
    title: 'Orders',
    icon: Icons.folder_open_outlined,
    activeIcon: Icons.folder,
    route: AppRoute.orders,
  ),
  SidebarItem(
    title: 'Settings',
    icon: Icons.settings_outlined,
    activeIcon: Icons.settings,
    route: AppRoute.settings,
  ),
  SidebarItem(
    title: 'Profile',
    icon: Icons.person_outline,
    activeIcon: Icons.person,
    route: AppRoute.profile,
  ),
];
