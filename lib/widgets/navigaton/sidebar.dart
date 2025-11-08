import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/widgets/navigaton/data/sidebar_data.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.onRouteChanged, this.currentRoute});

  final Function(AppRoute) onRouteChanged;
  final AppRoute? currentRoute;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  ...List<Widget>.generate(sidebarItems.length, (int index) {
                    final SidebarItem item = sidebarItems[index];
                    final bool isSelected = currentRoute == item.route;

                    return NavItem(
                      isSelected: isSelected,
                      item: item,
                      onRouteChanged: onRouteChanged,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.isSelected,
    required this.item,
    required this.onRouteChanged,
  });

  final bool isSelected;
  final SidebarItem item;
  final Function(AppRoute p1) onRouteChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepPurple.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            isSelected ? item.activeIcon ?? item.icon : item.icon,
            color: isSelected ? Colors.deepPurple : Colors.black,
          ),
          title: Text(
            item.title,
            style: TextStyle(
              color: isSelected ? Colors.deepPurple : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          onTap: () {
            onRouteChanged(item.route);
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
