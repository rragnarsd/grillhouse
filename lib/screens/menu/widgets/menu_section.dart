import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/menu/data/menu_data.dart';
import 'package:dashboard/screens/menu/widgets/menu_header.dart';
import 'package:dashboard/screens/menu/widgets/menu_list.dart';
import 'package:dashboard/screens/menu/widgets/menu_star_rating.dart';
import 'package:dashboard/screens/menu/widgets/update_product_form.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:dashboard/widgets/edit_order_modal.dart';
import 'package:flutter/material.dart';

class MenuSection extends StatefulWidget {
  const MenuSection({super.key, this.crossAxisCount});

  final int? crossAxisCount;

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  late MenuItem _selectedItem;

  @override
  void initState() {
    super.initState();

    _selectedItem = MenuData.items.first;
  }

  void _onItemSelected(MenuItem item) {
    setState(() => _selectedItem = item);
  }

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
            spacing: Responsive.isTablet(context) ? 16 : 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: MenuList(
                  crossAxisCount: widget.crossAxisCount,
                  onItemSelected: _onItemSelected,
                ),
              ),
              _MenuDetailCard(selectedItem: _selectedItem),
            ],
          ),
        ),
      ],
    );
  }
}

class _MenuDetailCard extends StatelessWidget {
  const _MenuDetailCard({required this.selectedItem});

  final MenuItem selectedItem;

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
                  imageUrl: selectedItem.image,
                  fit: BoxFit.cover,
                  height: 220,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 16),
              _NamePriceRow(name: selectedItem.name, price: selectedItem.price),
              const SizedBox(height: 6),
              const MenuStarRating(),
              const SizedBox(height: 12),
              Text(selectedItem.description, style: theme.textTheme.bodyMedium),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryOutlinedIconBtn(
                  onClick: () => _editProduct(context),
                  icon: Icons.edit,
                  label: Constants.editProduct,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editProduct(BuildContext context) {
    EditProductModal.show(
      context: context,
      child: UpdateProductForm(product: selectedItem),
    );
  }
}

class _NamePriceRow extends StatelessWidget {
  const _NamePriceRow({required this.name, required this.price});

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = MediaQuery.sizeOf(context).width;
        final bool isMediumTablet = width >= 767 && width <= 1200;

        if (isMediumTablet) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: theme.textTheme.headlineSmall,
              ),
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name, style: theme.textTheme.headlineSmall),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: theme.textTheme.headlineSmall,
            ),
          ],
        );
      },
    );
  }
}
