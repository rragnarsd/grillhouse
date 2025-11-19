import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/orders/widgets/daily_orders_section.dart';
import 'package:grill_house/screens/orders/widgets/orders_table.dart';
import 'package:grill_house/screens/orders/widgets/trending_orders.dart';
import 'package:grill_house/utils/extensions.dart';
import 'package:grill_house/widgets/status_card.dart';

class OrdersTabletScreen extends StatelessWidget {
  const OrdersTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<StatusCards>> cardRows = orderScreenCards.chunked(2);
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
        const IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(child: DailyOrdersSection()),
              SizedBox(width: 16),
              Expanded(child: TrendingOrdersSection()),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const OrdersTable(),
        const SizedBox(height: 24),
      ],
    );
  }
}
