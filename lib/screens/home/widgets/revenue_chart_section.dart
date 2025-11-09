import 'package:dashboard/screens/home/widgets/monthly_revenue_chart.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

class RevenueChartSection extends StatelessWidget {
  const RevenueChartSection({super.key});

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
              Constants.monthlyRevenu,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            MonthlyRevenueChart(),
          ],
        ),
      ),
    );
  }
}
