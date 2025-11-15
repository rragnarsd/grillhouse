import 'package:dashboard/screens/orders/widgets/orders_chart_section.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

class DailyOrdersSection extends StatelessWidget {
  const DailyOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Constants.monthlyOrders,
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const OrdersChartSection(),
          ],
        ),
      ),
    );
  }
}
