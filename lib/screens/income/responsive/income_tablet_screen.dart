import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/card_data.dart';
import 'package:grill_house/screens/income/widgets/income_by_category_section.dart';
import 'package:grill_house/screens/income/widgets/income_by_month_section.dart';
import 'package:grill_house/screens/income/widgets/income_by_payment_section.dart';
import 'package:grill_house/screens/income/widgets/income_by_week_section.dart';
import 'package:grill_house/utils/extensions.dart';
import 'package:grill_house/widgets/status_card.dart';

class IncomeTabletScreen extends StatelessWidget {
  const IncomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<List<StatusCards>> cardRows = incomeScreenCards.chunked(2);
    return ListView(
      children: <Widget>[
        for (final List<StatusCards> row in cardRows) ...<Widget>[
          Row(
            children: <Widget>[
              Expanded(child: StatusCard(data: row[0])),
              if (row.length > 1) ...<Widget>[
                const SizedBox(width: 16.0),
                Expanded(child: StatusCard(data: row[1])),
              ],
            ],
          ),
          const SizedBox(height: 16.0),
        ],
        const SizedBox(height: 16),
        const IntrinsicHeight(
          child: Row(
            spacing: 16,
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
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: IncomeByCategorySection()),
              Expanded(child: IncomeByWeekSection()),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
