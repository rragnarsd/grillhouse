import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/widgets/menu_star_rating.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

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
              Constants.bestSellers,
              style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: Constants.grilledChickenSandwichImg,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 4,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      Constants.grilledChickenSandwichName,
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      '\$${Constants.grilledChickenSandwichPrice.toStringAsFixed(2)}',
                      style: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),
                const MenuStarRating(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
