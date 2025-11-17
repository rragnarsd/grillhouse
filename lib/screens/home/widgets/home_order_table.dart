import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/theme/app_colors.dart';
import 'package:dashboard/widgets/buttons.dart';
import 'package:dashboard/widgets/delete_order_modal.dart';
import 'package:dashboard/widgets/order_table_source.dart';
import 'package:dashboard/widgets/view_order_modal.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class HomeOrderTable extends StatelessWidget {
  const HomeOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 480,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                Constants.latestOrders,
                style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
              ),
            ),
            const HomePaginatedTable(),
          ],
        ),
      ),
    );
  }
}

class HomePaginatedTable extends StatelessWidget {
  const HomePaginatedTable({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Expanded(
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: const CardThemeData(color: Colors.white, elevation: 0),
          dataTableTheme: DataTableThemeData(
            headingRowColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              return Colors.grey[200]!;
            }),
          ),
          scrollbarTheme: ScrollbarThemeData(
            thickness: WidgetStateProperty.all(5),
          ),
        ),
        child: PaginatedDataTable2(
          dataRowHeight: 32 * 1.2,
          minWidth: 1000,
          border: TableBorder.all(color: Colors.grey.shade300),
          wrapInCard: false,
          isVerticalScrollBarVisible: true,
          isHorizontalScrollBarVisible: true,
          columnSpacing: 12,
          horizontalMargin: 12,
          headingTextStyle: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          columns: <DataColumn>[
            const DataColumn2(size: ColumnSize.S, label: Text('Order Id')),
            const DataColumn(label: Text('Customer')),
            const DataColumn2(size: ColumnSize.S, label: Text(Constants.price)),
            const DataColumn2(size: ColumnSize.S, label: Text(Constants.date)),
            const DataColumn(label: Text(Constants.status)),
            const DataColumn2(
              size: ColumnSize.S,
              label: Text(Constants.action),
            ),
          ],
          rowsPerPage: orders.length.toInt(),
          source: OrderTableSource(
            onView: (Order order) =>
                ViewOrderModal.show(context: context, order: order),
            onEdit: (Order order) => print('Edit: ${order.productId}'),
            onDelete: (Order order) => onDelete(context, order),
          ),
        ),
      ),
    );
  }

  void onDelete(BuildContext context, Order order) {
    DeleteOrderModal.show(
      context: context,
      onConfirm: () => print('Delete: ${order.productId}'),
    );
  }
}

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Order #390561', style: theme.textTheme.headlineSmall),
          IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: Colors.grey.shade300);
  }
}

class CustomerSection extends StatelessWidget {
  const CustomerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey.shade300,
          child: const Text('J'),
        ),
        const SizedBox(height: 8),
        Text(
          'James Miller',
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
              backgroundColor: AppColors.secondary,
            ),
            PrimaryFilledIconButton(
              onPressed: () {},
              icon: Icons.phone,
              backgroundColor: AppColors.secondary,
            ),
            PrimaryFilledIconButton(
              onPressed: () {},
              icon: Icons.message,
              backgroundColor: AppColors.secondary,
            ),
          ],
        ),
      ],
    );
  }
}

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Order Items',
          style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Garlic Bread', style: theme.textTheme.bodyLarge),
          subtitle: Text('\$6.50 / plate', style: theme.textTheme.titleLarge),
          leading: const CircleAvatar(),
        ),
      ],
    );
  }
}

class TotalSection extends StatelessWidget {
  const TotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total', style: theme.textTheme.titleLarge),
        Text('\$100.00', style: theme.textTheme.headlineSmall),
      ],
    );
  }
}
