import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/utils/constants.dart';
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
                const Text(
                  'Trending Orders',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    ScrollArrow(
                      icon: Icons.arrow_back,
                      canScroll: _canScrollBack,
                      isHover: _isHoverBack,
                      onPressed: _scrollBack,
                      onHoverChange: (bool hover) =>
                          setState(() => _isHoverBack = hover),
                    ),
                    const SizedBox(width: 16),
                    ScrollArrow(
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
              height: 320,
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
                  itemBuilder: (_, __) => const TrendingOrderItemCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollArrow extends StatelessWidget {
  const ScrollArrow({
    super.key,
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
              ? (isHover ? Colors.blue.withValues(alpha: 0.2) : Colors.black12)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            icon,
            color: canScroll
                ? (isHover ? Colors.blue : Colors.black87)
                : Colors.grey,
          ),
          onPressed: canScroll ? onPressed : null,
        ),
      ),
    );
  }
}

class TrendingOrderItemCard extends StatelessWidget {
  const TrendingOrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 240,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: Constants.bestSellerImg,
                    fit: BoxFit.cover,
                    height: 220,
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Veg Taco'),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Price: 100',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.yellow),
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
