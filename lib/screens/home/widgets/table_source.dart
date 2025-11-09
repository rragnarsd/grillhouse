import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final Order order = orders[index];
    return DataRow2(
      color: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        return Colors.white;
      }),
      decoration: const BoxDecoration(color: Colors.transparent),
      cells: <DataCell>[
        DataCell(Text(order.id.toString())),
        DataCell(Text(order.productName)),
        DataCell(Text(order.customerName)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: order.statusColor.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(6),
            ),

            child: Text(order.statusLabel),
          ),
        ),
        DataCell(Text(order.deliveryTime)),
        DataCell(Text('\$${order.price.toStringAsFixed(0)}')),
        DataCell(
          PopupMenuButton<String>(
            color: Colors.white,
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) {
              print(value);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: Constants.view,
                child: Text(Constants.view),
              ),
              const PopupMenuItem<String>(
                value: Constants.edit,
                child: Text(Constants.edit),
              ),
              const PopupMenuItem<String>(
                value: Constants.delete,
                child: Text(Constants.delete),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
