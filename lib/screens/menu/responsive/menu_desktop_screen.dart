import 'package:flutter/material.dart';
import 'package:grill_house/screens/menu/widgets/menu_section.dart';
import 'package:grill_house/screens/menu/widgets/trending_menu_section.dart';

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
