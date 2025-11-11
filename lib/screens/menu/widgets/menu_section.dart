import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/data/menu_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MenuSection extends StatefulWidget {
  const MenuSection({super.key});

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 700,
      child: Row(
        spacing: 32,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[MenuList(), MenuListItem()],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SizedBox(
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
                    MenuGridList(categoryItems: categoryItems),
                    const SizedBox(height: 24),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuGridList extends StatelessWidget {
  const MenuGridList({super.key, required this.categoryItems});

  final List<MenuItem> categoryItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

class MenuListItem extends StatelessWidget {
  const MenuListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: Constants.bestSellerImg,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Crispy Calamari Rings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$4.99',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const MenuStarRating(),
              const SizedBox(height: 16),
              const Text(
                Constants.description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              const Text(
                'Lightly battered and perfectly fried golden calamari rings, served with a side of tangy marinara and zesty garlic aioli. Crunchy on the outside, tender on the inside — a classic appetizer that’s impossible to resist.',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryBtn(
                  onClick: () {},
                  label: Constants.editProduct,
                  bgColor: Colors.grey.shade600,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuStarRating extends StatelessWidget {
  const MenuStarRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star_half, color: Colors.amber, size: 20),
        Icon(Icons.star_border, color: Colors.amber, size: 20),
        SizedBox(width: 8),
        Text(
          '(12 Reviews)',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
