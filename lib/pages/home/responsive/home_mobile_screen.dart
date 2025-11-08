import 'package:dashboard/pages/home/data/card_data.dart';
import 'package:dashboard/pages/home/widgets/best_seller_section.dart';
import 'package:dashboard/pages/home/widgets/dashboard_order_table.dart';
import 'package:dashboard/pages/home/widgets/home_card.dart';
import 'package:dashboard/pages/home/widgets/revenue_chart_section.dart';
import 'package:flutter/material.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacing = 16.0;

    final List<List<HomeScreenCards>> cardRows = <List<HomeScreenCards>>[];
    for (int i = 0; i < homeScreenCards.length; i += 2) {
      cardRows.add(
        homeScreenCards.sublist(
          i,
          i + 2 > homeScreenCards.length ? homeScreenCards.length : i + 2,
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (List<HomeScreenCards> row in cardRows) ...<Widget>[
            Row(
              children: <Widget>[
                Expanded(child: HomeCard(data: row[0])),
                if (row.length > 1) ...<Widget>[
                  const SizedBox(width: spacing),
                  Expanded(child: HomeCard(data: row[1])),
                ],
              ],
            ),
            const SizedBox(height: spacing),
          ],
          const SizedBox(height: 8),
          const DashboardOrderTable(),
          const SizedBox(height: 24),
          const SizedBox(height: 360, child: BestSellerSection()),
          const SizedBox(height: 24),
          const SizedBox(height: 360, child: RevenueChartSection()),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
