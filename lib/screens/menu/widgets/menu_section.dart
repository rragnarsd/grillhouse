import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/widgets/menu_header.dart';
import 'package:dashboard/screens/menu/widgets/menu_list.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key, this.crossAxisCount});

  final int? crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const MenuHeader(),
        const SizedBox(height: 24),
        SizedBox(
          height: 700,
          child: Row(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: MenuList(crossAxisCount: crossAxisCount),
              ),
              const MenuDetailCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuDetailCard extends StatelessWidget {
  const MenuDetailCard({super.key});

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
              const NamePriceRow(
                name: 'Crispy Calamari Rings',
                price: '\$4.99',
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
                child: PrimaryElevatedIconBtn(
                  onPressed: () {},
                  icon: Icons.edit,
                  btnLabel: 'Edit Product',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NamePriceRow extends StatelessWidget {
  const NamePriceRow({super.key, required this.name, required this.price});

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = MediaQuery.sizeOf(context).width;
        final bool isMediumTablet = width >= 767 && width <= 880;

        if (isMediumTablet) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
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
