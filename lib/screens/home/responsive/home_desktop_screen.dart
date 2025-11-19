import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/home/widgets/best_seller_section.dart';
import 'package:grill_house/screens/home/widgets/home_order_table.dart';
import 'package:grill_house/screens/home/widgets/revenue_chart_section.dart';
import 'package:grill_house/widgets/status_card.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1366),
      child: ListView(
        children: <Widget>[
          StatusRow(statusCard: monthlyCards),
          const SizedBox(height: 32),
          const HomeOrderTable(),
          const SizedBox(height: 32),
          const IntrinsicHeight(
            child: Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: BestSellerSection()),
                Expanded(child: RevenueChartSection()),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
