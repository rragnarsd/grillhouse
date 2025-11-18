import 'dart:ui';

import 'package:dashboard/screens/menu/data/trending_menu_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/trending_order_card.dart';
import 'package:flutter/material.dart';

class TrendingOrdersSection extends StatefulWidget {
  const TrendingOrdersSection({super.key});

  @override
  State<TrendingOrdersSection> createState() => _TrendingOrdersSectionState();
}

class _TrendingOrdersSectionState extends State<TrendingOrdersSection> {
  final ScrollController _scrollController = ScrollController();
  bool _isHoverBack = false;
  bool _isHoverForward = false;

  void _scrollForward() {
    _scrollController.animateTo(
      _scrollController.offset + 260,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void _scrollBack() {
    _scrollController.animateTo(
      _scrollController.offset - 260,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  bool get _canScrollBack =>
      _scrollController.hasClients && _scrollController.offset > 0;

  bool get _canScrollForward =>
      _scrollController.hasClients &&
      _scrollController.offset < _scrollController.position.maxScrollExtent;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  Constants.trendingOrders,
                  style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
                ),
                Row(
                  children: <Widget>[
                    _ScrollArrow(
                      icon: Icons.arrow_back,
                      canScroll: _canScrollBack,
                      isHover: _isHoverBack,
                      onPressed: _scrollBack,
                      onHoverChange: (bool hover) =>
                          setState(() => _isHoverBack = hover),
                    ),
                    const SizedBox(width: 16),
                    _ScrollArrow(
                      icon: Icons.arrow_forward,
                      canScroll: _canScrollForward,
                      isHover: _isHoverForward,
                      onPressed: _scrollForward,
                      onHoverChange: (bool hover) =>
                          setState(() => _isHoverForward = hover),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 280,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: true,
                  dragDevices: <PointerDeviceKind>{
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, int index) => TrendingOrderItemCard(
                    item: TrendingMenuDataList.items[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollArrow extends StatelessWidget {
  const _ScrollArrow({
    required this.icon,
    required this.canScroll,
    required this.isHover,
    required this.onPressed,
    required this.onHoverChange,
  });

  final IconData icon;
  final bool canScroll;
  final bool isHover;
  final VoidCallback? onPressed;
  final ValueChanged<bool> onHoverChange;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHoverChange(true),
      onExit: (_) => onHoverChange(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: canScroll
              ? (isHover
                    ? AppColors.secondary.withValues(alpha: 0.2)
                    : Colors.black12)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: canScroll
                ? (isHover ? AppColors.secondary : Colors.black87)
                : Colors.grey.withValues(alpha: 0.4),
          ),
          onPressed: canScroll ? onPressed : null,
        ),
      ),
    );
  }
}
