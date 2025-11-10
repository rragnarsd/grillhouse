import 'dart:ui';

import 'package:dashboard/screens/home/data/card_data.dart';
import 'package:dashboard/screens/orders/widgets/orders_chart_section.dart';
import 'package:dashboard/screens/orders/widgets/orders_table.dart';
import 'package:dashboard/screens/orders/widgets/trending_orders.dart';
import 'package:dashboard/widgets/status_card.dart';
import 'package:flutter/material.dart';

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
        Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
        ),
        const SizedBox(height: 16),
        Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Trending Orders',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 320,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      scrollbars: true,
                      dragDevices: <PointerDeviceKind>{
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (BuildContext context, int index) =>
                          const TrendingOrderItemCard(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const OrdersTable(),
        const SizedBox(height: 24),
      ],
    );
  }
}
