import 'package:dashboard/screens/home/data/card_data.dart';
import 'package:dashboard/screens/home/widgets/best_seller_section.dart';
import 'package:dashboard/screens/home/widgets/home_order_table.dart';
import 'package:dashboard/screens/home/widgets/revenue_chart_section.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/widgets/status_card.dart';
import 'package:flutter/material.dart';

class HomeTabletScreen extends StatelessWidget {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<StatusCards>> cardRows = monthlyCards.chunked(2);

    return ListView(
      children: <Widget>[
        for (final List<StatusCards> row in cardRows) ...<Widget>[
          Row(
            children: <Widget>[
              Expanded(child: StatusCard(data: row[0])),
              if (row.length > 1) ...<Widget>[
                const SizedBox(width: 16.0),
                Expanded(child: StatusCard(data: row[1])),
              ],
            ],
          ),
          const SizedBox(height: 16.0),
        ],
        const SizedBox(height: 16),
        const HomeOrderTable(),
        const SizedBox(height: 32),
        const IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(child: BestSellerSection()),
              SizedBox(width: 16),
              Expanded(child: RevenueChartSection()),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
