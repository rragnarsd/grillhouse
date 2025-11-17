import 'package:dashboard/screens/home/data/card_data.dart';
import 'package:dashboard/screens/income/widgets/income_by_category_section.dart';
import 'package:dashboard/screens/income/widgets/income_by_month_section.dart';
import 'package:dashboard/screens/income/widgets/income_by_payment_section.dart';
import 'package:dashboard/screens/income/widgets/income_by_week_section.dart';
import 'package:dashboard/widgets/status_card.dart';
import 'package:flutter/material.dart';

class IncomeMobileScreen extends StatelessWidget {
  const IncomeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (final StatusCards cardData in orderScreenCards) ...<Widget>[
          StatusCard(data: cardData),
          const SizedBox(height: 12.0),
        ],
        const SizedBox(height: 16),
        const Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[IncomeByMonthSection(), IncomeByPaymentSection()],
        ),
        const SizedBox(height: 16),
        const Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[IncomeByCategorySection(), IncomeByWeekSection()],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
