import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/home/widgets/best_seller_section.dart';
import 'package:grill_house/screens/home/widgets/home_order_table.dart';
import 'package:grill_house/screens/home/widgets/revenue_chart_section.dart';
import 'package:grill_house/widgets/status_card.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (final StatusCards cardData in monthlyCards) ...<Widget>[
          StatusCard(data: cardData),
          const SizedBox(height: 12.0),
        ],
        const SizedBox(height: 8),
        const HomeOrderTable(),
        const SizedBox(height: 16),
        const SizedBox(height: 360, child: BestSellerSection()),
        const SizedBox(height: 16),
        const SizedBox(height: 360, child: RevenueChartSection()),
        const SizedBox(height: 16),
      ],
    );
  }
}
