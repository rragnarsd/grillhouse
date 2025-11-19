import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/income/widgets/income_by_category_section.dart';
import 'package:grill_house/screens/income/widgets/income_by_month_section.dart';
import 'package:grill_house/screens/income/widgets/income_by_payment_section.dart';
import 'package:grill_house/screens/income/widgets/income_by_week_section.dart';
import 'package:grill_house/widgets/status_card.dart';

class IncomeDesktopScreen extends StatelessWidget {
  const IncomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1366),
      child: ListView(
        children: <Widget>[
          StatusRow(statusCard: incomeScreenCards),
          const SizedBox(height: 32),
          const IntrinsicHeight(
            child: Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(flex: 2, child: IncomeByMonthSection()),
                Expanded(child: IncomeByPaymentSection()),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const IntrinsicHeight(
            child: Row(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: IncomeByCategorySection()),
                Expanded(child: IncomeByWeekSection()),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
