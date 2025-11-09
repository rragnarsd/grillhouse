import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigaton/data/sidebar_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.onRouteChanged, this.currentRoute});

  final Function(AppRoute) onRouteChanged;
  final AppRoute? currentRoute;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: <Widget>[
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(160),
                  child: Image.asset(Constants.profileImg, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ...sidebarItems.map((SidebarItem item) {
              final bool isSelected = currentRoute == item.route;
              return _NavItem(
                key: ValueKey<AppRoute>(item.route),
                item: item,
                isSelected: isSelected,
                onRouteChanged: onRouteChanged,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onRouteChanged,
  });

  final SidebarItem item;
  final bool isSelected;
  final Function(AppRoute) onRouteChanged;

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected ? Colors.deepPurple : Colors.black;
    final Color background = isSelected
        ? Colors.deepPurple.shade100
        : Colors.grey.shade200;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(6.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          onTap: () {
            if (!isSelected) {
              onRouteChanged(item.route);
              context.go(item.route.path);
            }
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  isSelected ? item.activeIcon ?? item.icon : item.icon,
                  color: color,
                ),
                const SizedBox(width: 12),
                Text(
                  item.title,
                  style: TextStyle(
                    color: color,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
