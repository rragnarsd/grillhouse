import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/order_data.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/widgets/delete_order_modal.dart';
import 'package:grill_house/widgets/order_table_source.dart';
import 'package:grill_house/widgets/view_order_modal.dart';

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
            const _HomePaginatedTable(),
          ],
        ),
      ),
    );
  }
}

class _HomePaginatedTable extends StatelessWidget {
  const _HomePaginatedTable();

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
            const DataColumn2(
              size: ColumnSize.S,
              label: Text(Constants.orderId),
            ),
            const DataColumn(label: Text(Constants.customer)),
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
            onEdit: (Order order) => print('Edit: ${order.orderId}'),
            onDelete: (Order order) => onDelete(context, order),
          ),
        ),
      ),
    );
  }

  void onDelete(BuildContext context, Order order) {
    DeleteOrderModal.show(
      context: context,
      onConfirm: () => print('Delete: ${order.orderId}'),
    );
  }
}
