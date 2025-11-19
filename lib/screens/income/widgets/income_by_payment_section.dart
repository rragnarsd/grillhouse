import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/utils/theme/app_colors.dart';

class IncomeByPaymentSection extends StatelessWidget {
  const IncomeByPaymentSection({super.key});

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
              Constants.incomeByPayment,
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const _IncomePieChart(),
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
  final ValueNotifier<int?> _touchedIndexNotifier = ValueNotifier<int?>(null);

  static const List<Map<String, dynamic>> _incomeData = <Map<String, dynamic>>[
    <String, dynamic>{'method': Constants.creditCard, 'amount': 12000.0},
    <String, dynamic>{'method': Constants.debitCard, 'amount': 25000.0},
    <String, dynamic>{'method': Constants.cash, 'amount': 18000.0},
    <String, dynamic>{'method': Constants.mobilePayment, 'amount': 35000.0},
  ];

  static final List<Color> _colors = <Color>[
    Colors.blue.shade300,
    Colors.green.shade300,
    AppColors.secondary.withValues(alpha: 0.8),
    Colors.amber.shade300,
  ];

  @override
  void dispose() {
    _touchedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            key: const ValueKey<int>(0),
            height: 240,
            child: ValueListenableBuilder<int?>(
              valueListenable: _touchedIndexNotifier,
              builder:
                  (BuildContext context, int? touchedIndex, Widget? child) {
                    final List<PieChartSectionData> sections =
                        _buildChartSections(touchedIndex);
                    return PieChart(
                      PieChartData(
                        sections: sections,
                        centerSpaceRadius: 32,
                        sectionsSpace: 2,
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, PieTouchResponse? response) {
                                if (!event.isInterestedForInteractions ||
                                    response?.touchedSection == null) {
                                  _touchedIndexNotifier.value = null;
                                  return;
                                }
                                _touchedIndexNotifier.value = response!
                                    .touchedSection!
                                    .touchedSectionIndex;
                              },
                        ),
                      ),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                    );
                  },
            ),
          ),
        ),
        const SizedBox(height: 32),
        ValueListenableBuilder<int?>(
          valueListenable: _touchedIndexNotifier,
          builder: (BuildContext context, int? touchedIndex, Widget? child) {
            final List<PieChartSectionData> sections = _buildChartSections(
              touchedIndex,
            );
            return _buildLabels(sections, theme, touchedIndex);
          },
        ),
      ],
    );
  }

  Widget _buildLabels(
    List<PieChartSectionData> sections,
    ThemeData theme,
    int? touchedIndex,
  ) {
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
                width: touchedIndex == i ? 14 : 12,
                height: touchedIndex == i ? 14 : 12,
                decoration: BoxDecoration(
                  color: sections[i].color,
                  shape: BoxShape.circle,
                  boxShadow: touchedIndex == i
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
                  fontSize: touchedIndex == i ? 15 : 14,
                  color: Colors.black87,
                  fontWeight: touchedIndex == i
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
      ],
    );
  }

  List<PieChartSectionData> _buildChartSections(int? touchedIndex) {
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
          radius: i == touchedIndex ? 95 : 80,
          titleStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: i == touchedIndex ? 16 : 14,
          ),
        ),
    ];
  }
}
