import 'package:dashboard/screens/menu/widgets/menu_list.dart';
import 'package:dashboard/screens/menu/widgets/mobile_tablet_list_item.dart';
import 'package:dashboard/screens/menu/widgets/trending_menu_section.dart';
import 'package:flutter/material.dart';

class MenuMobileScreen extends StatelessWidget {
  const MenuMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return ListView(
      children: <Widget>[
        SizedBox(height: screenHeight, child: const MenuList()),
        const SizedBox(height: 32),
        const MobileTabletListItem(),
        const SizedBox(height: 32),
        const TrendingMenuSection(),
        const SizedBox(height: 24),
      ],
    );
  }
}
