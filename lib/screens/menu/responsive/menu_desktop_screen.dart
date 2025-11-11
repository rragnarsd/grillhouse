import 'package:dashboard/screens/menu/widgets/menu_section.dart';
import 'package:dashboard/screens/menu/widgets/trending_menu_section.dart';
import 'package:flutter/material.dart';

class MenuDesktopScreen extends StatelessWidget {
  const MenuDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1366),
      child: ListView(
        children: <Widget>[
          const MenuSection(),
          const SizedBox(height: 32),
          const TrendingMenuSection(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
