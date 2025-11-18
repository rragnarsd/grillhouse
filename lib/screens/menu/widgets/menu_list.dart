import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/data/menu_data.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key, this.crossAxisCount, this.onItemSelected});

  final int? crossAxisCount;
  final void Function(MenuItem)? onItemSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: Category.values.map((Category category) {
            final List<MenuItem> categoryItems = MenuData.items
                .where((MenuItem item) => item.category == category)
                .toList();

            if (categoryItems.isEmpty) const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    category.displayName,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                _MenuGridList(
                  categoryItems: categoryItems,
                  crossAxisCount: crossAxisCount,
                  onItemSelected: onItemSelected,
                ),
                const SizedBox(height: 24),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _MenuGridList extends StatelessWidget {
  const _MenuGridList({
    required this.categoryItems,
    this.crossAxisCount,
    this.onItemSelected,
  });

  final List<MenuItem> categoryItems;
  final int? crossAxisCount;
  final void Function(MenuItem)? onItemSelected;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final int columns =
        crossAxisCount ??
        (width < 420 ? 1 : (Responsive.isMobile(context) ? 2 : 3));

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categoryItems.length,
      itemBuilder: (BuildContext context, int index) {
        final MenuItem item = categoryItems[index];

        return _MenuGridItem(
          item: item,
          onTap: onItemSelected != null ? () => onItemSelected!(item) : null,
        );
      },
    );
  }
}

class _MenuGridItem extends StatelessWidget {
  const _MenuGridItem({required this.item, this.onTap});

  final MenuItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.0,
                children: <Widget>[
                  Text(
                    item.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$${item.price.toStringAsFixed(2)} / ${item.servingUnit.label}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
