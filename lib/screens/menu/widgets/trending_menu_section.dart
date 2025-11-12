import 'dart:ui';

import 'package:dashboard/screens/orders/widgets/trending_orders.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TrendingMenuSection extends StatelessWidget {
  const TrendingMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TrendingMenuHeader(),
            SizedBox(height: 16),
            TrendingList(),
          ],
        ),
      ),
    );
  }
}

class TrendingList extends StatelessWidget {
  const TrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
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
          physics: const ClampingScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemBuilder: (_, __) => const TrendingOrderItemCard(),
        ),
      ),
    );
  }
}

class TrendingMenuHeader extends StatelessWidget {
  const TrendingMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              Constants.trendingMenu,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              Constants.mostOrderedMenu,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
        PrimaryElevatedIconBtn(
          onPressed: () {},
          icon: Icons.calendar_today_outlined,
          btnLabel: '23 January',
        ),
      ],
    );
  }
}
