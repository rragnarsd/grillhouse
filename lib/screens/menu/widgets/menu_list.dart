import 'package:dashboard/screens/menu/data/menu_data.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key, this.crossAxisCount});

  final int? crossAxisCount;

  @override
  Widget build(BuildContext context) {
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                MenuGridList(
                  categoryItems: categoryItems,
                  crossAxisCount: crossAxisCount,
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

class MenuGridList extends StatelessWidget {
  const MenuGridList({
    super.key,
    required this.categoryItems,
    this.crossAxisCount,
  });

  final List<MenuItem> categoryItems;
  final int? crossAxisCount;

  @override
  Widget build(BuildContext context) {
    final int columns =
        crossAxisCount ?? (Responsive.isMobile(context) ? 2 : 3);

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

        return MenuGridItem(item: item);
      },
    );
  }
}

class MenuGridItem extends StatelessWidget {
  const MenuGridItem({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Image.network(
                item.image,
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(item.price, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
