import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:grill_house/screens/home/data/order_data.dart';
import 'package:grill_house/utils/constants.dart';
import 'package:grill_house/widgets/date_header_tabs.dart';
import 'package:grill_house/widgets/delete_order_modal.dart';
import 'package:grill_house/widgets/order_table_source.dart';
import 'package:grill_house/widgets/view_order_modal.dart';

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[_OrdersHeader(), _OrdersPaginatedTablet()],
        ),
      ),
    );
  }
}

class _OrdersHeader extends StatefulWidget {
  const _OrdersHeader();

  @override
  State<_OrdersHeader> createState() => _OrdersHeaderState();
}

class _OrdersHeaderState extends State<_OrdersHeader> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return DateHeaderTabs(
      tabs: <String>['All Orders', 'Pending', 'Completed'],
      selectedDate: selectedDate,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
      onDateSelected: (DateTime? date) => setState(() => selectedDate = date),
    );
  }
}

class _OrdersPaginatedTablet extends StatelessWidget {
  const _OrdersPaginatedTablet();

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
