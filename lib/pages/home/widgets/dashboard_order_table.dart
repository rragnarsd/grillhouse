import 'package:dashboard/pages/home/widgets/table_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DashboardOrderTable extends StatelessWidget {
  const DashboardOrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Latest Orders',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  cardTheme: const CardThemeData(
                    color: Colors.white,
                    elevation: 0,
                  ),
                  dataTableTheme: DataTableThemeData(
                    headingRowColor: WidgetStateProperty.resolveWith<Color>((
                      Set<WidgetState> states,
                    ) {
                      return Colors.grey[200]!;
                    }),
                  ),
                ),
                child: PaginatedDataTable2(
                  dataRowHeight: 32 * 1.2,
                  minWidth: 900,
                  wrapInCard: false,
                  isVerticalScrollBarVisible: true,
                  isHorizontalScrollBarVisible: true,
                  columns: <DataColumn>[
                    const DataColumn2(
                      size: ColumnSize.S,
                      label: Text('Order ID'),
                    ),
                    const DataColumn(label: Text('Product Name')),
                    const DataColumn(label: Text('Customer Name')),
                    const DataColumn(label: Text('Status')),
                    const DataColumn(label: Text('Delivery Time')),
                    const DataColumn2(size: ColumnSize.S, label: Text('Price')),
                  ],
                  rowsPerPage: 8,
                  source: TableSource(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
