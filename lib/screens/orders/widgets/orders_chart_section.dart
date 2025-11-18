import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrdersChartSection extends StatefulWidget {
  const OrdersChartSection({super.key});

  @override
  State<OrdersChartSection> createState() => _OrdersChartSectionState();
}

class _OrdersChartSectionState extends State<OrdersChartSection> {
  int? _touchedIndex;
  late List<String> _topProducts;

  @override
  Widget build(BuildContext context) {
    final List<PieChartSectionData> sections = _buildChartSections();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height: 200,
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
          _buildProductLabels(sections),
        ],
      ),
    );
  }

  Widget _buildProductLabels(List<PieChartSectionData> sections) {
    final ThemeData theme = Theme.of(context);
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 24,
      runSpacing: 12,
      children: <Widget>[
        for (int i = 0; i < _topProducts.length; i++)
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
                _topProducts[i],
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
    final Map<String, int> productCounts = <String, int>{};
    for (final Order order in orders) {
      productCounts[order.productName] =
          (productCounts[order.productName] ?? 0) + 1;
    }

    final List<String> sortedProducts = productCounts.keys.toList()
      ..sort(
        (String a, String b) =>
            (productCounts[b] ?? 0).compareTo(productCounts[a] ?? 0),
      );
    final List<String> topProducts = sortedProducts.take(5).toList();
    _topProducts = topProducts;

    final int totalTopOrders = topProducts.fold<int>(
      0,
      (int sum, String product) => sum + (productCounts[product] ?? 0),
    );

    final List<Color> colors = <Color>[
      AppColors.secondary.withValues(alpha: 0.8),
      Colors.amber.shade300,
      Colors.indigo.shade300,
      Colors.green.shade300,
      Colors.blue.shade300,
    ];

    return <PieChartSectionData>[
      for (int i = 0; i < topProducts.length; i++)
        PieChartSectionData(
          value: (productCounts[topProducts[i]] ?? 0).toDouble(),
          title: totalTopOrders > 0
              ? '${((productCounts[topProducts[i]] ?? 0) / totalTopOrders * 100).toStringAsFixed(0)}%'
              : '',
          color: colors[i % colors.length],
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
