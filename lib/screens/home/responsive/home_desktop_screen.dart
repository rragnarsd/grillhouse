import 'package:dashboard/screens/home/data/card_data.dart';
import 'package:dashboard/screens/home/widgets/best_seller_section.dart';
import 'package:dashboard/screens/home/widgets/dashboard_order_table.dart';
import 'package:dashboard/screens/home/widgets/home_card.dart';
import 'package:dashboard/screens/home/widgets/revenue_chart_section.dart';
import 'package:flutter/material.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1366),
      child: ListView(
        children: <Widget>[
          const _HomeCardRow(),
          const SizedBox(height: 32),
          const DashboardOrderTable(),
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

class _HomeCardRow extends StatelessWidget {
  const _HomeCardRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(homeScreenCards.length, (int index) {
        final HomeScreenCards data = homeScreenCards[index];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < homeScreenCards.length - 1 ? 16.0 : 0,
            ),
            child: HomeCard(data: data),
          ),
        );
      }),
    );
  }
}
