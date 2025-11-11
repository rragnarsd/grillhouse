import 'package:dashboard/screens/reservations/data/reservation_data.dart';
import 'package:dashboard/screens/reservations/widgets/reservation_table_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ReservationTable extends StatelessWidget {
  const ReservationTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //TODO - Add Todays and Older Reservations
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Reservations',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            ReservationPaginatedTablet(),
          ],
        ),
      ),
    );
  }
}

class ReservationPaginatedTablet extends StatelessWidget {
  const ReservationPaginatedTablet({super.key});

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
            const DataColumn(label: Text('Name')),
            const DataColumn(label: Text('Email')),
            const DataColumn2(size: ColumnSize.S, label: Text('Persons')),
            const DataColumn2(size: ColumnSize.S, label: Text('Date')),
            const DataColumn(label: Text('Contact Number')),
            const DataColumn(label: Text('Status')),
          ],
          rowsPerPage: reservations.length.toInt(),
          source: ReservationTableSource(),
        ),
      ),
    );
  }
}
