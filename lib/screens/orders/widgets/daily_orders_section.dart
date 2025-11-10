import 'package:dashboard/screens/orders/widgets/orders_chart_section.dart';
import 'package:flutter/material.dart';

class DailyOrdersSection extends StatelessWidget {
  const DailyOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Monthly Orders',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            OrdersChartSection(),
          ],
        ),
      ),
    );
  }
}
