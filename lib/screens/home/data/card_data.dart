import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

class StatusCards {
  final String value;
  final String title;
  final IconData icon;
  final Color color;

  StatusCards({
    required this.value,
    required this.title,
    required this.icon,
    required this.color,
  });
}

//Today's
final List<StatusCards> orderScreenCards = <StatusCards>[
  StatusCards(
    value: '120',
    title: Constants.todaysOrders,
    icon: Icons.shopping_bag_outlined,
    color: Colors.orange.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '120',
    title: Constants.todaysIncome,
    icon: Icons.attach_money,
    color: Colors.green.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '240',
    title: Constants.todaysCustomers,
    icon: Icons.person_outlined,
    color: Colors.blue.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '140',
    title: Constants.cancelledOrders,
    icon: Icons.cancel_outlined,
    color: Colors.red.withValues(alpha: 0.2),
  ),
];

//Monthly
final List<StatusCards> monthlyCards = <StatusCards>[
  StatusCards(
    value: '120',
    title: Constants.monthlyOrders,
    icon: Icons.shopping_bag_outlined,
    color: Colors.orange.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '120',
    title: Constants.monthlyIncome,
    icon: Icons.attach_money,
    color: Colors.green.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '240',
    title: Constants.monthlyCustomers,
    icon: Icons.person_outlined,
    color: Colors.blue.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '140',
    title: Constants.monthlyAvgSpend,
    icon: Icons.attach_money,
    color: Colors.amber.withValues(alpha: 0.2),
  ),
];

//Income
final List<StatusCards> incomeScreenCards = <StatusCards>[
  StatusCards(
    value: '120',
    title: Constants.todaysIncome,
    icon: Icons.attach_money,
    color: Colors.orange.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '120',
    title: Constants.weeklyAvgSpend,
    icon: Icons.attach_money,
    color: Colors.blue.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '120',
    title: Constants.monthlyIncome,
    icon: Icons.attach_money,
    color: Colors.green.withValues(alpha: 0.2),
  ),
  StatusCards(
    value: '240',
    title: Constants.monthlyAvgSpend,
    icon: Icons.attach_money,
    color: Colors.amber.withValues(alpha: 0.2),
  ),
];
