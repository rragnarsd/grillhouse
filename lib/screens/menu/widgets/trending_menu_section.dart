import 'dart:ui';

import 'package:dashboard/screens/orders/widgets/trending_orders.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/widgets/date_picker_btn.dart';
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
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Constants.trendingMenu,
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              Constants.mostOrderedMenu,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        const DatePickerButton(),
      ],
    );
  }
}
