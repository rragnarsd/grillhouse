import 'package:dashboard/screens/reservations/data/reservation_data.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ReservationTableSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final Reservation reservation = reservations[index];
    return DataRow2(
      cells: <DataCell>[
        DataCell(Text(reservation.name)),
        DataCell(Text(reservation.email)),
        DataCell(Text(reservation.numberOfPeople.toString())),
        const DataCell(Text('Date')),
        DataCell(Text(reservation.contactNumber)),
        DataCell(
          InkWell(
            onTap: () => print('Status: ${reservation.status.displayName}'),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: reservation.status.color.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(reservation.status.displayName),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => reservations.length;

  @override
  int get selectedRowCount => 0;
}
