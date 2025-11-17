import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeByCategorySection extends StatelessWidget {
  const IncomeByCategorySection({super.key});

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
              'Income by Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 32),
            _IncomeByCategoryChart(),
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
        <String, dynamic>{'category': 'Dinner', 'amount': 28000.0},
        <String, dynamic>{'category': 'Lunch', 'amount': 22000.0},
        <String, dynamic>{'category': 'Breakfast', 'amount': 15000.0},
        <String, dynamic>{'category': 'Drinks', 'amount': 12000.0},
        <String, dynamic>{'category': 'Dessert', 'amount': 8000.0},
        <String, dynamic>{'category': 'Appetizers', 'amount': 5000.0},
      ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 280,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 30000,
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
                interval: 5000,
                getTitlesWidget: (double value, TitleMeta meta) {
                  if (value % 5000 != 0) return const SizedBox.shrink();
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
            horizontalInterval: 5000,
            getDrawingHorizontalLine: (double value) {
              return FlLine(color: Colors.grey.shade200, strokeWidth: 1);
            },
          ),
          barGroups: <BarChartGroupData>[
            for (int i = 0; i < _categoryData.length; i++)
              BarChartGroupData(
                x: i,
                barRods: <BarChartRodData>[
                  BarChartRodData(
                    toY: _categoryData[i]['amount'] as double,
                    color: _getColorForIndex(i),
                    width: 24.0,
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

  Color _getColorForIndex(int index) {
    final List<Color> colors = <Color>[
      Colors.purple.shade400,
      Colors.blue.shade400,
      Colors.orange.shade400,
      Colors.teal.shade400,
      Colors.pink.shade400,
      Colors.indigo.shade400,
    ];
    return colors[index % colors.length];
  }
}
