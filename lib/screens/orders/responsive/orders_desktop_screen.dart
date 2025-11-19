import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/orders/widgets/daily_orders_section.dart';
import 'package:grill_house/screens/orders/widgets/orders_table.dart';
import 'package:grill_house/screens/orders/widgets/trending_orders.dart';
import 'package:grill_house/widgets/status_card.dart';

class OrdersDesktopScreen extends StatelessWidget {
  const OrdersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1366),
      child: ListView(
        children: <Widget>[
          StatusRow(statusCard: orderScreenCards),
          const SizedBox(height: 32),
          const IntrinsicHeight(
            child: Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: DailyOrdersSection()),
                Expanded(child: TrendingOrdersSection()),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const OrdersTable(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
