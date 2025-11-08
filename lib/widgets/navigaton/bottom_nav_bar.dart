import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigaton/data/sidebar_data.dart';
import 'package:flutter/material.dart';

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
      currentIndex: selectedIndex >= 0 ? selectedIndex : 0,
      onTap: (int index) {
        if (index < sidebarItems.length) {
          onRouteChanged(sidebarItems[index].route);
        }
      },
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
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
