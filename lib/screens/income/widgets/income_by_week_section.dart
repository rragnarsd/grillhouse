import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeByWeekSection extends StatelessWidget {
  const IncomeByWeekSection({super.key});

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
              'Daily Income by Day of Week',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            _IncomeByDayChart(),
          ],
        ),
      ),
    );
  }
}

class _IncomeByDayChart extends StatelessWidget {
  const _IncomeByDayChart();

  static const List<Map<String, dynamic>> _dayData = <Map<String, dynamic>>[
    <String, dynamic>{'day': 'Mon', 'amount': 3500.0},
    <String, dynamic>{'day': 'Tue', 'amount': 4200.0},
    <String, dynamic>{'day': 'Wed', 'amount': 3800.0},
    <String, dynamic>{'day': 'Thu', 'amount': 4500.0},
    <String, dynamic>{'day': 'Fri', 'amount': 6800.0},
    <String, dynamic>{'day': 'Sat', 'amount': 8200.0},
    <String, dynamic>{'day': 'Sun', 'amount': 7200.0},
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 280,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 9000,
          minY: 0,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.grey.shade800,
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final int index = value.toInt();
                  if (index < 0 || index >= _dayData.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _dayData[index]['day'] as String,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 2000,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value % 2000 != 0) return const SizedBox.shrink();
                  return Text(
                    '\$${(value / 1000).toStringAsFixed(0)}k',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
              left: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 2000,
            getDrawingHorizontalLine: (double value) {
              return FlLine(color: Colors.grey.shade200, strokeWidth: 1);
            },
          ),
          barGroups: <BarChartGroupData>[
            for (int i = 0; i < _dayData.length; i++)
              BarChartGroupData(
                x: i,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    toY: _dayData[i]['amount'] as double,
                    color: _getColorForDay(i),
                    width: 20.0,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                  ),
                ],
              ),
          ],
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      ),
    );
  }

  Color _getColorForDay(int index) {
    // Weekend days get different colors
    if (index >= 5) {
      // Saturday and Sunday
      return Colors.amber.shade400;
    }
    return Colors.cyan.shade400;
  }
}
