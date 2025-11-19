import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/order_data.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/utils/theme/app_colors.dart';

class DailyOrdersSection extends StatelessWidget {
  const DailyOrdersSection({super.key});

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
              Constants.monthlyOrders,
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const _OrdersChartSection(),
          ],
        ),
      ),
    );
  }
}

class _OrdersChartSection extends StatefulWidget {
  const _OrdersChartSection();

  @override
  State<_OrdersChartSection> createState() => _OrdersChartSectionState();
}

class _OrdersChartSectionState extends State<_OrdersChartSection> {
  final ValueNotifier<int?> _touchedIndexNotifier = ValueNotifier<int?>(null);
  late List<String> _topProducts;

  @override
  void initState() {
    super.initState();
    _initializeTopProducts();
  }

  @override
  void dispose() {
    _touchedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height: 200,
              child: ValueListenableBuilder<int?>(
                valueListenable: _touchedIndexNotifier,
                builder: (BuildContext context, int? touchedIndex, Widget? _) {
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
                              _touchedIndexNotifier.value =
                                  response!.touchedSection!.touchedSectionIndex;
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
              return _buildProductLabels(sections, touchedIndex);
            },
          ),
        ],
      ),
    );
  }

  void _initializeTopProducts() {
    final Map<String, int> productCounts = <String, int>{};
    for (final Order order in orders) {
      for (final OrderItem item in order.items) {
        productCounts[item.productName] =
            (productCounts[item.productName] ?? 0) + 1;
      }
    }

    final List<String> sortedProducts = productCounts.keys.toList()
      ..sort(
        (String a, String b) =>
            (productCounts[b] ?? 0).compareTo(productCounts[a] ?? 0),
      );
    _topProducts = sortedProducts.take(5).toList();
  }

  Widget _buildProductLabels(
    List<PieChartSectionData> sections,
    int? touchedIndex,
  ) {
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
                _topProducts[i],
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
    final Map<String, int> productCounts = <String, int>{};
    for (final Order order in orders) {
      for (final OrderItem item in order.items) {
        productCounts[item.productName] =
            (productCounts[item.productName] ?? 0) + 1;
      }
    }

    final int totalTopOrders = _topProducts.fold<int>(
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
      for (int i = 0; i < _topProducts.length; i++)
        PieChartSectionData(
          value: (productCounts[_topProducts[i]] ?? 0).toDouble(),
          title: totalTopOrders > 0
              ? '${((productCounts[_topProducts[i]] ?? 0) / totalTopOrders * 100).toStringAsFixed(0)}%'
              : '',
          color: colors[i % colors.length],
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
