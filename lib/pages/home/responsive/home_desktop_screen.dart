import 'package:dashboard/pages/home/data/card_data.dart';
import 'package:dashboard/pages/home/widgets/best_seller_section.dart';
import 'package:dashboard/pages/home/widgets/dashboard_order_table.dart';
import 'package:dashboard/pages/home/widgets/home_card.dart';
import 'package:dashboard/pages/home/widgets/revenue_chart_section.dart';
import 'package:flutter/material.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: 32,
        children: <Widget>[
          _HomeCardRow(),
          DashboardOrderTable(),
          SizedBox(
            height: 360,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: BestSellerSection()),
                SizedBox(width: 32),
                Expanded(child: RevenueChartSection()),
              ],
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _HomeCardRow extends StatelessWidget {
  const _HomeCardRow();

  @override
  Widget build(BuildContext context) {
    const double spacing = 16.0;
    return Row(
      children: List<Widget>.generate(homeScreenCards.length, (int index) {
        final HomeScreenCards data = homeScreenCards[index];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < homeScreenCards.length - 1 ? spacing : 0,
            ),
            child: HomeCard(data: data),
          ),
        );
      }),
    );
  }
}
