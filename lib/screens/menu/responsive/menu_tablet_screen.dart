import 'package:flutter/material.dart';
import 'package:grill_house/screens/menu/widgets/menu_section.dart';
import 'package:grill_house/screens/menu/widgets/trending_menu_section.dart';

class MenuTabletScreen extends StatelessWidget {
  const MenuTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;

        final bool isMediumTablet = width <= 1030;

        return ListView(
          children: <Widget>[
            MenuSection(crossAxisCount: isMediumTablet ? 2 : null),
            const SizedBox(height: 32),
            const TrendingMenuSection(),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
