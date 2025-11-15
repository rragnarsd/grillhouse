import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/widgets/date_header_tabs.dart';
import 'package:dashboard/widgets/order_table_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

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
          children: <Widget>[OrdersHeader(), OrdersPaginatedTablet()],
        ),
      ),
    );
  }
}

class OrdersHeader extends StatefulWidget {
  const OrdersHeader({super.key});

  @override
  State<OrdersHeader> createState() => _OrdersHeaderState();
}

class _OrdersHeaderState extends State<OrdersHeader> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return DateHeaderTabs(
      tabs: <String>['All Orders', 'Pending', 'Completed'],
      selectedDate: selectedDate,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
      onDateSelected: (DateTime? date) {
        setState(() => selectedDate = date);
      },
    );
  }
}

class OrdersPaginatedTablet extends StatelessWidget {
  const OrdersPaginatedTablet({super.key});

  @override
  Widget build(BuildContext context) {
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
          minWidth: 700,
          border: TableBorder.all(color: Colors.grey.shade300),
          wrapInCard: false,
          isVerticalScrollBarVisible: true,
          isHorizontalScrollBarVisible: true,
          columnSpacing: 12,
          horizontalMargin: 12,
          columns: <DataColumn>[
            const DataColumn(label: Text(Constants.productName)),
            const DataColumn(label: Text(Constants.productId)),
            const DataColumn2(size: ColumnSize.S, label: Text(Constants.price)),
            const DataColumn(label: Text(Constants.date)),
            const DataColumn(label: Text(Constants.status)),
            const DataColumn2(
              size: ColumnSize.S,
              label: Text(Constants.action),
            ),
          ],
          rowsPerPage: orders.length.toInt(),
          source: OrderTableSource(),
        ),
      ),
    );
  }
}
