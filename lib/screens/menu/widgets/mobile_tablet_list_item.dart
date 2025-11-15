import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/widgets/menu_section.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MobileTabletListItem extends StatelessWidget {
  const MobileTabletListItem({super.key});

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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: Constants.bestSellerImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Crispy Calamari Rings',
                  style: theme.textTheme.headlineSmall,
                ),
                Text('\$4.99', style: theme.textTheme.headlineSmall),
              ],
            ),
            const SizedBox(height: 4),
            const MenuStarRating(),
            const SizedBox(height: 16),
            Text(
              Constants.description,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Lightly battered and perfectly fried golden calamari rings, served with a side of tangy marinara and zesty garlic aioli. Crunchy on the outside, tender on the inside — a classic appetizer that\'s impossible to resist.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
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
    );
  }
}
