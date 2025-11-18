import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeByPaymentSection extends StatelessWidget {
  const IncomeByPaymentSection({super.key});

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
              'Income by Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            _IncomePieChart(),
          ],
        ),
      ),
    );
  }
}

class _IncomePieChart extends StatefulWidget {
  const _IncomePieChart();

  @override
  State<_IncomePieChart> createState() => _IncomePieChartState();
}

class _IncomePieChartState extends State<_IncomePieChart> {
  int? _touchedIndex;

  static const List<Map<String, dynamic>> _incomeData = <Map<String, dynamic>>[
    <String, dynamic>{'method': 'Credit Card', 'amount': 12000.0},
    <String, dynamic>{'method': 'Debit Card', 'amount': 25000.0},
    <String, dynamic>{'method': 'Cash', 'amount': 18000.0},
    <String, dynamic>{'method': 'Mobile Payment', 'amount': 35000.0},
  ];

  static final List<Color> _colors = <Color>[
    Colors.blue.shade300,
    Colors.green.shade300,
    AppColors.secondary.withValues(alpha: 0.8),
    Colors.amber.shade300,
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<PieChartSectionData> sections = _buildChartSections();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            key: const ValueKey<int>(0),
            height: 240,
            child: PieChart(
              PieChartData(
                sections: sections,
                centerSpaceRadius: 32,
                sectionsSpace: 2,
                pieTouchData: PieTouchData(
                  touchCallback:
                      (FlTouchEvent event, PieTouchResponse? response) {
                        if (!event.isInterestedForInteractions ||
                            response?.touchedSection == null) {
                          setState(() => _touchedIndex = null);
                          return;
                        }
                        setState(() {
                          _touchedIndex =
                              response!.touchedSection!.touchedSectionIndex;
                        });
                      },
                ),
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
            ),
          ),
        ),
        const SizedBox(height: 32),
        _buildLabels(sections, theme),
      ],
    );
  }

  Widget _buildLabels(List<PieChartSectionData> sections, ThemeData theme) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 24,
      runSpacing: 12,
      children: <Widget>[
        for (int i = 0; i < _incomeData.length; i++)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _touchedIndex == i ? 14 : 12,
                height: _touchedIndex == i ? 14 : 12,
                decoration: BoxDecoration(
                  color: sections[i].color,
                  shape: BoxShape.circle,
                  boxShadow: _touchedIndex == i
                      ? <BoxShadow>[
                          BoxShadow(
                            color: sections[i].color.withValues(alpha: 0.5),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _incomeData[i]['method'] as String,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: _touchedIndex == i ? 15 : 14,
                  color: Colors.black87,
                  fontWeight: _touchedIndex == i
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
      ],
    );
  }

  List<PieChartSectionData> _buildChartSections() {
    final double totalIncome = _incomeData.fold<double>(
      0,
      (double sum, Map<String, dynamic> item) =>
          sum + (item['amount'] as double),
    );

    return <PieChartSectionData>[
      for (int i = 0; i < _incomeData.length; i++)
        PieChartSectionData(
          value: _incomeData[i]['amount'] as double,
          title: totalIncome > 0
              ? '${((_incomeData[i]['amount'] as double) / totalIncome * 100).toStringAsFixed(0)}%'
              : '',
          color: _colors[i % _colors.length],
          radius: i == _touchedIndex ? 95 : 80,
          titleStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: i == _touchedIndex ? 16 : 14,
          ),
        ),
    ];
  }
}
