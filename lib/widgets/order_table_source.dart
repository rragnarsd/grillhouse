import 'package:dashboard/screens/home/data/order_data.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:dashboard/utils/extensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class OrderTableSource extends DataTableSource {
  final void Function(Order) onView;
  final void Function(Order) onEdit;
  final void Function(Order) onDelete;

  OrderTableSource({
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });
  @override
  DataRow? getRow(int index) {
    final Order order = orders[index];
    return DataRow2(
      color: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        return Colors.white;
      }),
      decoration: const BoxDecoration(color: Colors.transparent),
      cells: <DataCell>[
        DataCell(Text(order.productId)),
        DataCell(Text(order.customerName)),
        DataCell(Text('\$${order.price.toStringAsFixed(0)}')),
        DataCell(Text(order.date.toDdMmYy())),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: order.statusColor.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Text(order.statusLabel),
          ),
        ),
        DataCell(
          PopupMenuButton<String>(
            color: Colors.white,
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) => print(value),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: Constants.view,
                child: const Text(Constants.view),
                onTap: () => onView(order),
              ),
              PopupMenuItem<String>(
                value: Constants.edit,
                child: const Text(Constants.edit),
                onTap: () => onEdit(order),
              ),
              PopupMenuItem<String>(
                value: Constants.delete,
                child: const Text(Constants.delete),
                onTap: () => onDelete(order),
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
