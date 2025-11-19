import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grill_house/utils/routes.dart';
import 'package:grill_house/utils/theme/app_colors.dart';
import 'package:grill_house/widgets/navigation/data/sidebar_data.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentRoute,
    required this.onRouteChanged,
  });

  final AppRoute currentRoute;
  final Function(AppRoute) onRouteChanged;

  int _getSelectedIndex() {
    return sidebarItems.indexWhere(
      (SidebarItem item) => item.route == currentRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = _getSelectedIndex();

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: selectedIndex >= 0 ? selectedIndex : 0,
      onTap: (int index) {
        if (index < sidebarItems.length) {
          final SidebarItem item = sidebarItems[index];
          onRouteChanged(item.route);
          context.go(item.route.path);
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: sidebarItems.map((SidebarItem item) {
        final bool isSelected = currentRoute == item.route;
        return BottomNavigationBarItem(
          icon: Icon(isSelected ? item.activeIcon ?? item.icon : item.icon),
          label: item.title,
        );
      }).toList(),
    );
  }
}
