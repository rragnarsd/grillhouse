import 'package:dashboard/utils/routes.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/navigation/data/sidebar_data.dart';
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
          color: AppColors.backgroundDefault,
          border: Border(
            right: BorderSide(color: Colors.grey.shade200, width: 0.6),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: <Widget>[
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/favicon.png',
                fit: BoxFit.cover,
                height: 100,
                width: 160,
              ),
            ),
            const SizedBox(height: 24),
            ...sidebarItems.map(
              (SidebarItem item) => _NavItem(
                item: item,
                isSelected: currentRoute == item.route,
                onRouteChanged: onRouteChanged,
              ),
            ),
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
    final ThemeData theme = Theme.of(context);

    final Color textColor = isSelected
        ? AppColors.textPrimary
        : AppColors.textSecondary;
    final Color backgroundColor = isSelected
        ? AppColors.backgroundSelected
        : AppColors.backgroundUnselected.withValues(alpha: 0.1);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: backgroundColor,
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
                  color: textColor,
                ),
                const SizedBox(width: 12),
                Text(
                  item.title,
                  style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
