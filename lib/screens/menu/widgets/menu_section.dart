import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/widgets/menu_header.dart';
import 'package:dashboard/screens/menu/widgets/menu_list.dart';
import 'package:dashboard/screens/menu/widgets/update_product_form.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

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
    final ThemeData theme = Theme.of(context);
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
              Text(
                Constants.description,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Lightly battered and perfectly fried golden calamari rings, served with a side of tangy marinara and zesty garlic aioli. Crunchy on the outside, tender on the inside — a classic appetizer that’s impossible to resist.',
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryElevatedIconBtn(
                  onPressed: () => _editProduct(context),
                  icon: Icons.edit,
                  btnLabel: Constants.editProduct,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editProduct(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    WoltModalSheet.show(
      context: context,
      modalTypeBuilder: (BuildContext context) => context.modalType,
      barrierDismissible: true,
      pageListBuilder: (BuildContext modalContext) =>
          <SliverWoltModalSheetPage>[
            SliverWoltModalSheetPage(
              backgroundColor: Colors.white,
              navBarHeight: 20,
              pageTitle: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  //TODO - Add the name of the product
                  'Edit Product',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              mainContentSliversBuilder: (BuildContext context) => <Widget>[
                const UpdateProductForm(),
              ],
            ),
          ],
    );
  }
}

class NamePriceRow extends StatelessWidget {
  const NamePriceRow({super.key, required this.name, required this.price});

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = MediaQuery.sizeOf(context).width;
        final bool isMediumTablet = width >= 767 && width <= 880;

        if (isMediumTablet) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(price, style: theme.textTheme.headlineSmall),
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name, style: theme.textTheme.headlineSmall),
            Text(price, style: theme.textTheme.headlineSmall),
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
    final ThemeData theme = Theme.of(context);
    return Row(
      children: <Widget>[
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const Icon(Icons.star_half, color: Colors.amber, size: 20),
        const Icon(Icons.star_border, color: Colors.amber, size: 20),
        const SizedBox(width: 8),
        Text(
          '(12 Reviews)',
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
