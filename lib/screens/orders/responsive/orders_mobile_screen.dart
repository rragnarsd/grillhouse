import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/orders/widgets/daily_orders_section.dart';
import 'package:grill_house/screens/orders/widgets/orders_table.dart';
import 'package:grill_house/screens/orders/widgets/trending_orders.dart';
import 'package:grill_house/widgets/status_card.dart';

class OrdersMobileScreen extends StatelessWidget {
  const OrdersMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (final StatusCards cardData in orderScreenCards) ...<Widget>[
          StatusCard(data: cardData),
          const SizedBox(height: 12.0),
        ],
        const SizedBox(height: 16),
        const DailyOrdersSection(),
        const SizedBox(height: 16),
        const TrendingOrdersSection(),
        const SizedBox(height: 16),
        const OrdersTable(),
        const SizedBox(height: 24),
      ],
    );
  }
}
