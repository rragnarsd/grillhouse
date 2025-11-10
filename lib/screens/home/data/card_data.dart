import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

class StatusCards {
  final String value;
  final String title;
  final IconData icon;

  StatusCards({required this.value, required this.title, required this.icon});
}

final List<StatusCards> orderScreenCards = <StatusCards>[
  StatusCards(value: '120', title: Constants.todaysOrders, icon: Icons.folder),
  StatusCards(value: '120', title: Constants.todaysIncome, icon: Icons.folder),
  StatusCards(
    value: '240',
    title: Constants.todaysCustomers,
    icon: Icons.folder,
  ),
  StatusCards(
    value: '140',
    title: Constants.cancelledOrders,
    icon: Icons.folder,
  ),
];

final List<StatusCards> monthlyCards = <StatusCards>[
  StatusCards(value: '120', title: 'Monthly Orders', icon: Icons.folder),
  StatusCards(value: '120', title: 'Monthly Income', icon: Icons.folder),
  StatusCards(value: '240', title: 'Monthly Customers', icon: Icons.folder),
  //TODO - Monthly Income ÷ Monthly Customers
  StatusCards(value: '140', title: 'Monthly Avg. Spend', icon: Icons.folder),
];
