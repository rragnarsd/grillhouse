import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grill_house/screens/menu/data/menu_data.dart';
import 'package:grill_house/screens/menu/widgets/menu_header.dart';
import 'package:grill_house/screens/menu/widgets/menu_list.dart';
import 'package:grill_house/screens/menu/widgets/menu_star_rating.dart';
import 'package:grill_house/screens/menu/widgets/trending_menu_section.dart';
import 'package:grill_house/screens/menu/widgets/update_product_form.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/widgets/buttons.dart';
import 'package:grill_house/widgets/edit_order_modal.dart';

class MenuMobileScreen extends StatefulWidget {
  const MenuMobileScreen({super.key});

  @override
  State<MenuMobileScreen> createState() => _MenuMobileScreenState();
}

class _MenuMobileScreenState extends State<MenuMobileScreen> {
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
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return ListView(
      children: <Widget>[
        const MenuHeader(),
        const SizedBox(height: 24),
        SizedBox(
          height: screenHeight,
          child: MenuList(onItemSelected: _onItemSelected),
        ),
        const SizedBox(height: 32),
        _MobileListItem(selectedItem: _selectedItem),
        const SizedBox(height: 32),
        const TrendingMenuSection(),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _MobileListItem extends StatelessWidget {
  const _MobileListItem({required this.selectedItem});

  final MenuItem selectedItem;

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
                  imageUrl: selectedItem.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(selectedItem.name, style: theme.textTheme.headlineSmall),
                Text(
                  '\$${selectedItem.price.toStringAsFixed(2)}',
                  style: theme.textTheme.headlineSmall,
                ),
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
            Text(selectedItem.description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 24),
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
    );
  }

  void _editProduct(BuildContext context) {
    EditProductModal.show(
      context: context,
      child: UpdateProductForm(product: selectedItem),
    );
  }
}
