import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyRevenueChart extends StatelessWidget {
  const MonthlyRevenueChart({super.key});

  static const List<String> _months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static const List<double> _revenues = <double>[
    3200.0,
    4500.0,
    3800.0,
    5200.0,
    6100.0,
    7500.0,
    6800.0,
    8200.0,
    7900.0,
    9100.0,
    8800.0,
    9600.0,
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color color = Colors.blue.shade400;
    const double barWidth = 16.0;
    const BorderRadius borderRadius = BorderRadius.vertical(
      top: Radius.circular(4),
    );

    return SizedBox(
      height: 280,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 10000,
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
                getTitlesWidget: (double value, TitleMeta meta) {
                  final int index = value.toInt();
                  if (index < 0 || index >= _months.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _months[index],
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
          gridData: const FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 2000,
          ),
          barGroups: <BarChartGroupData>[
            for (int i = 0; i < _revenues.length; i++)
              BarChartGroupData(
                x: i,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    toY: _revenues[i],
                    color: color,
                    width: barWidth,
                    borderRadius: borderRadius,
                  ),
                ],
              ),
          ],
        ),
        duration: const Duration(milliseconds: 150),
        curve: Curves.linear,
      ),
    );
  }
}
