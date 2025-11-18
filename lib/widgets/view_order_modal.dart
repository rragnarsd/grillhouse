import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/action_btn_section.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ViewOrderModal {
  static void show({required BuildContext context, required Order order}) {
    WoltModalSheet.show(
      context: context,
      modalTypeBuilder: (BuildContext c) => c.modalType,
      barrierDismissible: true,
      pageListBuilder: (BuildContext modalContext) =>
          <SliverWoltModalSheetPage>[
            SliverWoltModalSheetPage(
              backgroundColor: Colors.white,
              navBarHeight: 20,
              pageTitle: _OrderHeader(
                onClose: () => Navigator.of(modalContext).pop(),
                orderId: order.orderId,
              ),
              mainContentSliversBuilder: (_) => <Widget>[
                const SliverToBoxAdapter(child: _DividerSection()),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: _CustomerSection(
                      customerName: order.customerName,
                      customerImg: order.customerImg,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: _DividerSection()),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: _OrderItemsSection(items: order.items),
                  ),
                ),
                const SliverToBoxAdapter(child: _DividerSection()),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: _TotalSection(totalPrice: order.totalPrice),
                  ),
                ),
                const SliverToBoxAdapter(child: _DividerSection()),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: ActionButtonsSection(
                      primaryBtnLabel: 'Refund Order',
                      secondaryBtnLabel: 'Track Order',
                      onPrimaryBtnPressed: () {},
                      primaryBtnColor: AppColors.secondary,
                      primaryBtnTextColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
    );
  }
}

class _OrderHeader extends StatelessWidget {
  const _OrderHeader({required this.onClose, required this.orderId});

  final VoidCallback onClose;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('#$orderId', style: theme.textTheme.headlineSmall),
          IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}

class _DividerSection extends StatelessWidget {
  const _DividerSection();

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.grey.shade300);
  }
}

class _OrderItemsSection extends StatelessWidget {
  const _OrderItemsSection({required this.items});

  final List<OrderItem> items;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Constants.orderItems,
          style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ...items.map(
          (OrderItem item) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: item.productImage,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.productName, style: theme.textTheme.bodyLarge),
                    Text(
                      '\$${item.productPrice.toStringAsFixed(2)}',
                      style: theme.textTheme.titleLarge,
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

class _TotalSection extends StatelessWidget {
  const _TotalSection({required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total', style: theme.textTheme.titleLarge),
        Text(
          '\$${totalPrice.toStringAsFixed(2)}',
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}

class _CustomerSection extends StatelessWidget {
  const _CustomerSection({
    required this.customerName,
    required this.customerImg,
  });

  final String customerName;
  final String customerImg;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 48,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: CachedNetworkImageProvider(customerImg),
        ),
        const SizedBox(height: 8),
        Text(
          customerName,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: <Widget>[
            PrimaryFilledIconButton(
              onPressed: () {},
              icon: Icons.email,
              backgroundColor: Colors.grey.shade200,
            ),
            PrimaryFilledIconButton(
              onPressed: () {},
              icon: Icons.phone,
              backgroundColor: Colors.grey.shade200,
            ),
            PrimaryFilledIconButton(
              onPressed: () {},
              icon: Icons.message,
              backgroundColor: Colors.grey.shade200,
            ),
          ],
        ),
      ],
    );
  }
}
