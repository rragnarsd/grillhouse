import 'package:dashboard/screens/home/data/card_data.dart';
import 'package:dashboard/screens/home/widgets/best_seller_section.dart';
import 'package:dashboard/screens/home/widgets/dashboard_order_table.dart';
import 'package:dashboard/screens/home/widgets/home_card.dart';
import 'package:dashboard/screens/home/widgets/revenue_chart_section.dart';
import 'package:flutter/material.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (final HomeScreenCards cardData in homeScreenCards) ...<Widget>[
          HomeCard(data: cardData),
          const SizedBox(height: 12.0),
        ],

        const SizedBox(height: 8),
        const DashboardOrderTable(),
        const SizedBox(height: 16),
        const SizedBox(height: 360, child: BestSellerSection()),
        const SizedBox(height: 16),
        const SizedBox(height: 360, child: RevenueChartSection()),
        const SizedBox(height: 16),
      ],
    );
  }
}
