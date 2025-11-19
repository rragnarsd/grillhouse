import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/utils/theme/app_colors.dart';

class IncomeByCategorySection extends StatelessWidget {
  const IncomeByCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Constants.incomeByCategory,
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const _IncomeByCategoryChart(),
          ],
        ),
      ),
    );
  }
}

class _IncomeByCategoryChart extends StatelessWidget {
  const _IncomeByCategoryChart();

  static const List<Map<String, dynamic>> _categoryData =
      <Map<String, dynamic>>[
        <String, dynamic>{'category': Constants.dinner, 'amount': 28000.0},
        <String, dynamic>{'category': Constants.lunch, 'amount': 22000.0},
        <String, dynamic>{'category': Constants.breakfast, 'amount': 15000.0},
        <String, dynamic>{'category': Constants.drinks, 'amount': 12000.0},
        <String, dynamic>{'category': Constants.dessert, 'amount': 8000.0},
        <String, dynamic>{'category': Constants.appetizers, 'amount': 5000.0},
      ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double maxY = 30000.0;
    const double interval = 5000.0;

    final List<Color> colors = <Color>[AppColors.secondary, Colors.amber];

    return SizedBox(
      height: 280,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY,
          minY: 0,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.grey.shade800,
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 1,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final int index = value.toInt();
                  if (index < 0 || index >= _categoryData.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _categoryData[index]['category'] as String,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: interval,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value % interval != 0) return const SizedBox.shrink();
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
            horizontalInterval: interval,
            getDrawingHorizontalLine: (double value) =>
                FlLine(color: Colors.grey.shade200, strokeWidth: 1),
          ),
          barGroups: List<BarChartGroupData>.generate(_categoryData.length, (
            int index,
          ) {
            final double amount = _categoryData[index]['amount'] as double;
            return BarChartGroupData(
              x: index,
              barRods: <BarChartRodData>[
                BarChartRodData(
                  toY: amount,
                  color: colors[index % colors.length],
                  width: 24.0,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                ),
              ],
            );
          }),
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      ),
    );
  }
}
